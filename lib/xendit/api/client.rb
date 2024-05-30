# frozen_string_literal: true

require 'faraday'

module Xendit
  module Api
    class Client
      API_KEY = ENV.fetch('XENDIT_API_KEY', nil)

      class << self
        def create(http_request, params, base_url)
          response = connection.send(http_request, base_url) do |req|
            req.headers['Content-Type'] = 'application/json'
            req.headers['Authorization'] = "Basic #{auth_token}"
            req.body = params.to_json if http_request == :post
          end

          JSON.parse(response.body)
        end

        private

        def connection
          @connection ||= Faraday.new
        end

        def auth_token
          Base64.strict_encode64("#{API_KEY}:")
        end
      end
    end
  end
end
