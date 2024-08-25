# lib/whatsapp_client.rb

require 'faraday'
require 'json'
module WhatsappJs
  class Client
    BASE_URL = 'http://localhost:3030'.freeze
    class << self
      def send_message(to:, message:)
        response = connection.post('/send-message') do |req|
          req.headers['Content-Type'] = 'application/json'
          req.body = { message: message, to: "#{to}@c.us" }.to_json
        end

        handle_response(response)
      end

      private

      def connection
        @connection ||= Faraday.new(url: BASE_URL) do |faraday|
          faraday.request :json
          faraday.response :logger # for logging the request/response
          faraday.adapter Faraday.default_adapter
        end
      end

      def handle_response(response)
        case response.status
        when 200
          JSON.parse(response.body)
        else
          { error: "Error: #{response.status}", details: response.body }
        end
      end
    end
  end
end
