# frozen_string_literal: true

require 'faraday'

module Xendit
  module Api
    class Invoice
      BASE_URL = 'https://api.xendit.co/v2/invoices'

      class << self
        def create(params)
          Xendit::Api::Client.create(:post, params, BASE_URL)
        end

        def get(params)
          Xendit::Api::Client.create(:get, params, "#{BASE_URL}/#{params['id']}")
        end
      end
    end
  end
end
