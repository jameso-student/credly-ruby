module Credly
  class Client
    include Credly::Actions::Badges
    attr_reader :organization_id, :url
    attr_accessor :sandbox

    BASE_URL_P  = "https://api.credly.com"
    BASE_URL_S  = "https://sandbox-api.credly.com"

    def initialize(version: 'v1', organization_id:, access_token:, sandbox: false)
      @base_url = sandbox ? BASE_URL_S : BASE_URL_P
      @url = [@base_url, version].join('/')
      @version = version
      @organization_id = organization_id
      @access_token = access_token
      @sandbox = sandbox
    end

    def connection
      @connection ||= Connection.new(@url, @access_token)
    end

    def base_url
      @sandbox ? BASE_URL_S : BASE_URL_P
    end
  end
end