# frozen_string_literal: true

class BankAccount < ApplicationRecord
  belongs_to :user
  belongs_to :payout_channel

  has_many :declares, dependent: :restrict_with_error
  has_many :memos, dependent: :restrict_with_error

  validates :name, :number, presence: true
  validates :name, uniqueness: { scope: [:payout_channel_id] }
  validates :number, uniqueness: { scope: [:payout_channel_id, :user_id] }

  def details
    "#{payout_channel.name} | #{name} - #{number}"
  end
end
