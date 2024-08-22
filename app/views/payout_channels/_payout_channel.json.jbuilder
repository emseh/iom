# frozen_string_literal: true

json.extract! payout_channel, :id, :name, :code, :payout_type, :active, :created_at, :updated_at
json.url payout_channel_url(payout_channel, format: :json)
