module Credly
  class Client
    require 'json'
    include Credly::Connection
    include Credly::API
    attr_accessor :options
    attr_reader :badges

    def initialize(args = {})
      @options = Credly.options.merge args
      full_url = [options[:base_endpoint], options[:version], 'organizations', options[:organization_id]].join('/')
      unless args[:access_token]
        raise ArgumentError.new "Need an 'access_token' parameter"
      end
      @connection = new_connection full_url, options[:access_token]
      @badges = Badges.new @connection
    end
  end
end