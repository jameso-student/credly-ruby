require 'faraday'

module Credly
  module Connection
    def new_connection(url, access_token)
      @connection = Faraday.new(url: url) do |builder|
        builder.request :json
        builder.response :json
        builder.request :authorization, 'Basic', -> { Base64.strict_encode64(access_token) }
      end
    end

    def connection
      @connection
    end

    def connection=(con)
      @connection = con
    end
  end
end