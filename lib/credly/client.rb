module Credly
  class Client
    include Credly::Actions::Badges
    attr_reader :organization_id
    def initialize(base_url:, version: 'v1', organization_id:, access_token:)
      @url = [base_url, version].join('/')
      @version = version
      @organization_id = organization_id
      @access_token = access_token
    end

    def connection
      unless defined? @connection
        @connection = Connection.new(@url, @access_token)
      end
      @connection
    end
  end
end