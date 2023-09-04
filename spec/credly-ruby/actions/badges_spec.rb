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

  describe '#badges_revoke' do
    it 'issues the correct PUT request to revoke a badge' do
      id = 0 
      reason = 'Check bounced'
      suppress_notification = false

      revoke_params = {
        reason: reason,
        suppress_revoke_notification_email: suppress_notification
      }

      stub = stub_request(:put, "#{@client.url}/organizations/#{@client.organization_id}/badges/#{id}/revoke")
             .with(body: revoke_params.to_json)

      @client.badges_revoke(id, revoke_params)

      expect(stub).to have_been_requested
    end
  end

  describe '#badges_replace' do
    it 'issues the correct POST request to replace a badge' do
      id = 0 

      params = {
        "badge_template_id": "4008b9b1-1251-40a3-ba90-1bbc9720fc37",
        "issued_at": "2014-04-01 09:41:00 -0500",
        "issued_to": "Firstname Lastname",
        "issued_to_first_name": "Firstname",
        "issued_to_last_name": "Lastname",
        "issuer_earner_id": "earner-1",
        "expires_at": false,
        "country_name": "United States of America",
        "state_or_province": "Minnesota",
        "evidence": [
          {
            "type": "UrlEvidence",
            "value": "http://www.example.com/evidence",
            "description": "Description in URL evidence is optional",
            "name": "Evidence"
          }
        ],
        "notification_message": "Lorem ipsum dolor"
      }

      stub = stub_request(:post, "#{@client.url}/organizations/#{@client.organization_id}/badges/#{id}/replace")
             .with(body: params.to_json)

      @client.badges_replace(id, params)

      expect(stub).to have_been_requested
    end
  end
  
end
