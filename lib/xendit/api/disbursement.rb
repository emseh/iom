# frozen_string_literal: true

require 'faraday'

module Xendit
  module Api
    class Disbursement
      BASE_URL = 'https://api.xendit.co/disbursements'

      class << self
        def create(params)
          ::Xendit::Api::DisbursementClient.create(params, BASE_URL)
        end
      end
    end
  end
end
