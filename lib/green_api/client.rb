# frozen_string_literal: true

require 'faraday'
require 'json'

module GreenApi
  class Client
    GREEN_API_URL            = ENV.fetch('GREEN_API_URL', nil)
    GREEN_API_ID_INSTANCE    = ENV.fetch('GREEN_API_ID_INSTANCE', nil)
    GREEN_API_TOKEN_INSTANCE = ENV.fetch('GREEN_API_TOKEN_INSTANCE', nil)

    class << self
      def send_message(chat_id, message)
        response = Faraday.post(send_message_url) do |req|
          req.headers['Content-Type'] = 'application/json'
          req.body = { chatId: "#{chat_id}@c.us", message: message }.to_json
        end

        parse_response(response)
      end

      private

      def send_message_url
        @send_message_url ||= "#{GREEN_API_URL}/waInstance#{GREEN_API_ID_INSTANCE}/sendMessage/#{GREEN_API_TOKEN_INSTANCE}"
      end

      def parse_response(response)
        case response.status
        when 200
          Rails.logger.debug 'Message sent successfully!'
        else
          Rails.logger.debug { "Failed to send message. Status: #{response.status}" }
        end

        JSON.parse(response.body)
      end
    end
  end
end
