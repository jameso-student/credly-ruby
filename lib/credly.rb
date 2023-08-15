module Credly
  attr_accessor :options

  def self.base_endpoint=(endpoint)
    options[:base_endpoint] = endpoint
  end

  def self.base_endpoint
    options[:base_endpoint]
  end

  def self.debugging?
    !!options[:debugging]
  end

  def self.access_token=(access_token)
    options[:access_token] = access_token
  end

  def self.access_token
    options[:access_token]
  end

  def self.version=(version)
    options[:version] = version
  end

  def self.version
    options[:version]
  end

  def self.options
    if defined? @@options
      @@options
    else
      @@options = { :base_endpoint => 'https://sandbox-api.credly.com/',
                    :access_token  => nil,
                    :organization_id => nil,
                    :version       => 'v1', }
    end
  end

  def self.configuration
    if block_given?
      yield(self)
    else
      options
    end
  end

  require 'credly/connection'
  require 'credly/api/badges'
  require 'credly/client'
end