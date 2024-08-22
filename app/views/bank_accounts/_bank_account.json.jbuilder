# frozen_string_literal: true

json.extract! bank_account, :id, :user_id, :payout_channel_id, :name, :number, :active, :created_at, :updated_at
json.url bank_account_url(bank_account, format: :json)
