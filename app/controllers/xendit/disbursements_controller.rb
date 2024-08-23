# frozen_string_literal: true

module Xendit
  class DisbursementsController < ApiController
    def callback
      # Withdraws::UpdateService.new(params).perform
      Rails.logger.debug params
      render json: nil, status: :ok
    end
  end
end
