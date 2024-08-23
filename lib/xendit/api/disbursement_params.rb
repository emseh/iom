module Xendit
  module Api
    class DisbursementParams
      DEFAULT_FEE_PERCENTAGE = ENV.fetch('DEFAULT_XENDIT_FEE_PERCENTAGE', 3).to_f
      DEFAULT_CURRENCY = ENV.fetch('DEFAULT_CURRENCY', 'IDR')
      DEFAULT_TOPUP_DURATION = ENV.fetch('DEFAULT_TOPUP_DURATION', 3600).to_i

      def initialize(params)
        @params = params
      end

      def generate
        generate_attributes
      end

      private

      def generate_attributes
        {
          external_id: "disb-#{@params[:profile_information_id]}",
          amount: withdraw_amount,
          bank_code: payout_channel&.code,
          account_holder_name: user_bank&.name,
          account_number: user_bank&.number,
          description: 'Withdraw'
        }
      end

      def payout_channel
        user_bank&.payout_channel
      end

      def withdraw_amount
        @withdraw_amount ||= @params[:amount]&.to_i
      end

      def user_bank
        @user_bank ||= UserBank.find(@params[:user_bank_id])
      end

      def user
        @user ||= ProfileInformation.find(@params[:profile_information_id])
      end
    end
  end
end
