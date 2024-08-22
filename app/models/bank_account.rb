# frozen_string_literal: true

class BankAccount < ApplicationRecord
  belongs_to :user
  belongs_to :payout_channel

  validates :name, :number, presence: true
  validates :name, uniqueness: { scope: [:payout_channel_id] }
  validates :number, uniqueness: { scope: [:payout_channel_id, :user_id] }
end
