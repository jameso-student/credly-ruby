# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Actions::OBI do
  subject { @client }

  before do
    @client = Credly::Client.new(auth_token: 'token')
  end

  describe '#badge_assertion_get' do
    it 'issues the correct GET request' do
      badge_id = 1
      stub = stub_request(:get, "#{@client.url}/obi/v2/badge_assertions/#{badge_id}")

      @client.badge_assertion_get(badge_id)

      expect(stub).to have_been_requested
    end
  end
end
