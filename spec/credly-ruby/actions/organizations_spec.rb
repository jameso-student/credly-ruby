# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Actions::Badges do
  subject { @client }

  before do
    @client = Credly::Client.new(organization_id: 'id', auth_token: 'token')
  end

  describe '#organization_list' do
    it 'issues the correct GET request' do
      stub = stub_request(:get, "#{@client.url}/organizations")

      @client.organizations_list

      expect(stub).to have_been_requested
    end
  end

  describe '#organization_get' do
    it 'issues the correct GET request' do
      id = 1
      stub = stub_request(:get, "#{@client.url}/organizations/#{id}")

      @client.organization_get(id)

      expect(stub).to have_been_requested
    end
  end
  
  describe '#organization_update' do
    it 'issues the correct PUT request' do
      id = 1

      update_params = {
        "name": "Example Organization",
        "website_url": "https://www.example.com",
        "webhook_url": "https://example.com/webhook_endpoint",
        "location": "East Junius, Ohio",
        "zip_or_postal_code": "55437",
        "contact_email": "info@example.com",
        "legal_contact_email": "legal@example.com",
        "organization_type": "Auto Parts Reseller",
        "bio": "Since 1994",
        "twitter_url": "https://twitter.com/example",
        "facebook_url": "https://www.facebook.com/example",
        "photo": "https://cdn.example.com/path/to/image.png",
        "city": "Bloomington",
        "state_or_province": "Minnesota",
        "country": "United States",
        "address": "1313 Mockingbird Lane",
        "hide_subscription": false
      }

      stub = stub_request(:put, "#{@client.url}/organizations/#{id}").with(body: update_params)

      @client.organization_update(id,update_params)

      expect(stub).to have_been_requested
    end
  end

  describe '#organization_event_get' do
    it 'issues the correct GET request' do
      id = 1
      event_id = 2
      stub = stub_request(:get, "#{@client.url}/organizations/#{id}/events/#{event_id}")

      @client.organization_event_get(id, event_id)

      expect(stub).to have_been_requested
    end
  end
end
