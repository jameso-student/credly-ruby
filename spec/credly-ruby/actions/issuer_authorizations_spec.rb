# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Actions::IssuerAuthorizations do
  subject { @client }

  before do
    @client = Credly::Client.new(auth_token: 'token')
    @organization_id = 1
  end

  describe '#issuer_get' do
    it 'issues the correct GET request' do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/issuers")

      @client.issuer_get(@organization_id)

      expect(stub).to have_been_requested
    end
  end
end
