# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Client do
  subject { @client }

  before do
    @client = described_class.new(auth_token: 'token')
  end

  describe '.initialize' do
    it 'returns a client object' do
      expect(@client).to be_a(described_class)
    end
  end

  describe '#connection' do
    it 'returns a connection instance' do
      expect(@client.connection).to be_a(Credly::Connection)
    end
  end

  describe '#base_url' do
    it 'returns sandbox url with sandbox' do
      @client.sandbox = true

      expect(@client.base_url).to eq(Credly::Client::BASE_URL_S)
    end

    it 'returns production url without sandbox' do
      @client.sandbox = false

      expect(@client.base_url).to eq(Credly::Client::BASE_URL_P)
    end
  end

  describe '#auth_token' do
    it 'sets new auth_token' do
      new_token = 'New Token'
      @client.auth_token = new_token
      expect(@client.auth_token).to eq(new_token)
    end
  end
end
