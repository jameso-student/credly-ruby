require 'faraday'

module Credly
  class Connection
    def initialize(url, access_token)
      @connection = Faraday.new(url: url) do |builder|
        builder.request :json
        builder.headers[:accept] = 'application/json'
        builder.response :json
        builder.request :authorization, 'Basic', -> { Base64.strict_encode64(access_token) }
      end
    end

    def delete(path, params = {})
      request(:delete, path, params)
    end

    def get(path, params = {})
      request(:get, path, params)
    end

    def post(path, params = {})
      request(:post, path, params)
    end

    def put(path, params = {})
      request(:put, path, params)
    end

    def request(method, path, params)
      @connection.send(method, path, params)
    end
  end
end