module Xendit
  class InvoiceTopupService
    DEFAULT_FEE_PERCENTAGE = ENV.fetch('DEFAULT_XENDIT_TOPUP_FEE_PERCENTAGE', 3).to_f
    DEFAULT_CURRENCY = ENV.fetch('DEFAULT_CURRENCY', 'IDR')
    DEFAULT_TOPUP_DURATION = ENV.fetch('DEFAULT_TOPUP_DURATION', 3600).to_i

    def initialize(params)
      @params = params
    end

    def generate
      generate_attributes
    end

    private

    def generate_attributes # rubocop:disable Metrics/MethodLength
      {
        external_id: @params[:profile_information_id],
        amount: total_amount,
        payment_methods: [payment_method&.code],
        invoice_duration: DEFAULT_TOPUP_DURATION,
        customer: customer_data,
        customer_notification_preference: customer_notification,
        success_redirect_url: @params[:success_redirect_url],
        failure_redirect_url: @params[:failure_redirect_url],
        currency: DEFAULT_CURRENCY,
        items: [item_data],
        fees: [bank_fee_data, vat_fee_data]
      }
    end

    def total_amount
      (topup_amount + vat_fee + bank_fee)
    end

    def customer_data
      data = {
        given_names: user.first_name,
        surname: user.last_name,
        email: @params[:email]
      }

      data[:addresses] = [customer_address] if user.country
      data
    end

    def customer_address
      { country: country_name }
    end

    def country_name
      ISO3166::Country.find_country_by_alpha3(user.country)&.common_name
    end

    def customer_notification
      {
        invoice_created: %w[whatsapp sms email],
        invoice_reminder: %w[whatsapp sms email],
        invoice_paid: %w[whatsapp sms email],
        invoice_expired: %w[whatsapp sms email]
      }
    end

    def item_data
      {
        name: 'Top Up',
        quantity: 1,
        price: topup_amount
      }
    end

    def admin_fee_data
      {
        type: 'admin fee',
        value: admin_fee
      }
    end

    def bank_fee_data
      {
        type: 'bank fee',
        value: bank_fee
      }
    end

    def vat_fee_data
      {
        type: 'vat',
        value: vat_fee
      }
    end

    def bank_fee
      if payment_method.code == 'CREDIT_CARD'
        (((topup_amount + admin_fee) * credit_card_percentage / 100) + payment_method&.fee)&.to_i
      else
        payment_method&.fee&.to_i
      end
    end

    def admin_fee
      (topup_amount * DEFAULT_FEE_PERCENTAGE.to_i / 100)
    end

    def vat_fee
      (bank_fee * payment_method.vat / 100)&.to_i
    end

    def credit_card_percentage
      payment_method&.cc_percentage
    end

    def topup_amount
      @topup_amount ||= @params[:amount]&.to_i
    end

    def payment_method
      @payment_method ||= PaymentMethod.find_by!(code: @params[:payment_method])
    end

    def user
      @user ||= ProfileInformation.find(@params[:profile_information_id])
    end
  end
end
