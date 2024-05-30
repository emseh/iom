# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

module Xendit
  module Api
    class DisbursementClient
      API_KEY = ENV.fetch('XENDIT_API_KEY', nil)

      class << self
        def create(params, base_url)
          uri = URI.parse(base_url)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true # Enable SSL if needed

          request = Net::HTTP::Post.new(uri.path)
          request.basic_auth(API_KEY, '')
          request.set_form_data(params)
          response = http.request(request)

          JSON.parse(response.body)
        end

        private

        def auth_token(api_key)
          Base64.strict_encode64("#{api_key}:")
        end
      end
    end
  end
end
