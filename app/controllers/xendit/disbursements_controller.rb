# frozen_string_literal: true

module Xendit
  class DisbursementsController < ApiController
    before_action :write_xendit_logger, only: :callback

    def callback
      external_id_parts  = params['external_id'].split('-')
      disbursement_class = external_id_parts.second == 'memo' ? Memo : Declare
      record             = disbursement_class.find(external_id_parts.third)
      params['status'] == 'COMPLETED' ? record.update!(status: 'paid') : record.update!(status: 'failed')
      render json: nil, status: :ok
    end

    private

    def write_xendit_logger
      xendit_logger = Logger.new(Rails.root.join('log/xendit_callback.log'))
      xendit_logger.info params
    end
  end
end
