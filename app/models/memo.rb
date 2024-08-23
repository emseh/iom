# frozen_string_literal: true

class Memo < ApplicationRecord
  mount_uploader :memo_proof, ProofUploader

  has_rich_text :description

  belongs_to :user
  belongs_to :memo_category
  belongs_to :bank_account

  has_one :payout_channel, through: :bank_account

  enum status: { submitted: 0, approved: 1, pending: 2, failed: 3, paid: 5, finished: 6 }

  validates :status, :description, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validate :sufficient_balance_for_approval, if: -> { status == 'approved' && status_was == 'submitted' }

  after_update :set_paid, if: -> { status_previously_was == 'submitted' && status == 'approved' }

  def set_paid
    Xendit::Api::Disbursement.create(disbursement_params)
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
