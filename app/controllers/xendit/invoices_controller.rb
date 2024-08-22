# frozen_string_literal: true

module Xendit
  class InvoicesController < ApiController
    include TopupParams
    include InvoiceParams

    skip_before_action :authorize_user!, only: %i[callback]

    before_action :pundit_authorize!, only: %i[create topup]

    def create
      validate_message = Transaction::ValidateInvoiceService.new(invoice_params).perform
      return render json: validate_message, status: :bad_request if validate_message.present?

      xendit_params = ::Xendit::InvoiceParamsService.new(invoice_params).generate
      response      = ::Xendit::Api::Invoice.create(xendit_params)

      Transaction::InvoiceCreateService.new(response, invoice_params).perform if response['id'].present?

      render json: response, status: response['id'].present? ? 200 : 422
    end

    def topup
      validate_message = Topups::ValidateService.new(topup_params).perform
      return render json: validate_message, status: :bad_request if validate_message.present?

      xendit_params = ::Xendit::InvoiceTopupService.new(topup_params).generate
      response      = ::Xendit::Api::Invoice.create(xendit_params)

      Topups::CreateService.new(response, topup_params).perform if response['id'].present?
      render json: response
    end

    def callback
      callback = ::Xendit::Api::Invoice.get(params)

      if params.dig(:items, 0, :name) == 'Top Up'
        Topups::UpdateService.new(params, callback).perform
      else
        Transaction::InvoiceUpdateService.new(params, callback).perform
      end

      render json: nil, status: :ok
    end
  end
end
