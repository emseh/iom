require 'faraday'
require 'json'

module Xendit
  module Api
    class Balance
      BASE_URL = 'https://api.xendit.co/balance'.freeze

      class << self
        def get
          Xendit::Api::Client.create(:get, nil, BASE_URL)
        end

        def amount
          get['balance']
        end
      end
    end
  end
end
