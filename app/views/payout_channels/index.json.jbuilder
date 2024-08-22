# frozen_string_literal: true

json.array! @payout_channels, partial: 'payout_channels/payout_channel', as: :payout_channel
