# frozen_string_literal: true

class Memo < ApplicationRecord
  mount_uploader :memo_proof, ProofUploader

  has_rich_text :description

  belongs_to :user
  belongs_to :memo_category
  belongs_to :bank_account

  has_one :user_information, through: :user
  has_one :patner, through: :user
  has_one :user_patner, through: :user
  has_one :payout_channel, through: :bank_account

  enum status: { submitted: 0, approved: 1, pending: 2, failed: 3, paid: 5, finished: 6 }

  validates :status, :description, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validate :sufficient_balance_for_approval, if: -> { status == 'approved' && status_was == 'submitted' }

  after_update :set_paid, if: -> { status_previously_was == 'submitted' && status == 'approved' }
  after_update :send_whatsapp_notification, if: -> { status_previously_was == 'approved' && status == 'paid' }

  def self.ransackable_attributes(_auth_object = nil)
    Memo.attribute_names + %w[id_value user_information_full_name]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[bank_account memo_category payout_channel rich_text_description user user_information user_patner]
  end

  def set_paid
    Xendit::Api::Disbursement.create(disbursement_params)
  end

  def send_whatsapp_notification
    number   = Phonelib.parse(user.user_information.phone_number).e164.delete('+')
    message  = "Hi #{user.user_information.full_name}, \n\n" \
               "Pencairan Anda untuk Memorandum #{memo_category.name}, telah berhasil dengan nominal sebesar #{idr_amount} \n\n" \
               "Silahkan upload bukti pembelian pada url dibawah: \n" \
               "https://#{ENV.fetch('HOST', nil)}/memos/#{id}"
    WhatsappJs::Client.send_message(to: number, message: message)
    update(status: :finished)
  end

  def idr_amount
    ActionController::Base.helpers.number_to_currency(amount, unit: 'Rp ', separator: ',', delimiter: '.', precision: 2)
  end

  def disbursement_params
    {
      external_id: "disb-memo-#{id}-#{user_id}",
      user_id: user_id,
      amount: amount.to_i,
      bank_code: bank_account.payout_channel.code,
      account_holder_name: bank_account.name,
      account_number: bank_account.number,
      description: memo_category.name
    }
  end

  private

  def sufficient_balance_for_approval
    errors.add(:amount, 'Insufficient balance to approve this memo.') if Xendit::Api::Balance.amount < amount
  end
end
