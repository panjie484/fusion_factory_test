# frozen_string_literal: true

module BigCommerce
  class Client
    class << self
      def configure(base_url:, x_auth_client:, x_auth_token:)
        @base_url = base_url
        @x_auth_client = x_auth_client
        @x_auth_token = x_auth_token
      end

      def request(method, path, params)
        headers = {
          'X-Auth-Client' => @x_auth_client,
          'X-Auth-Token' => @x_auth_token,
          'Content-Type' => 'application/json',
          'Accept' => 'application/json'
        }

        response = connection.send(method, path, params, headers)

        return JSON.parse(response.body)
      end

      def connection
        @connection ||= Faraday.new(url: @base_url)
      end
    end
  end
end

