# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Actions::Badges do
  subject { @client }

  before do
    @client = Credly::Client.new(organization_id: 'id', auth_token: 'token')
  end

  describe '#badges_get' do
    it 'issues the correct GET request with query params' do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@client.organization_id}/badges")
             .with(query: { filter: 'query::FakePerson' })

      @client.badges_get({ filter: 'query::FakePerson' })

      expect(stub).to have_been_requested
    end
  end

  describe '#badges_delete' do
    it 'issues the correct DELETE request with query params' do
      id = 0
      stub = stub_request(:delete, "#{@client.url}/organizations/#{@client.organization_id}/badges/#{id}")

      @client.badges_delete(id)

      expect(stub).to have_been_requested
    end
  end
end
