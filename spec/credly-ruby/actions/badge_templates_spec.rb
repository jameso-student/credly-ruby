# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Actions::BadgeTemplates do
  subject { @client }

  before do
    @client = Credly::Client.new(organization_id: 'id', auth_token: 'token')
  end

  describe '#badge_templates_get' do
    it 'issues the correct request without query params' do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@client.organization_id}/badge_templates")

      @client.badge_templates_get

      expect(stub).to have_been_requested
    end
  end

  describe '#badge_templates_get' do
    it 'issues the correct request with query params' do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@client.organization_id}/badge_templates")
             .with(query: { filter: 'query::FakeParam' })

      @client.badge_templates_get({ filter: 'query::FakeParam' })

      expect(stub).to have_been_requested
    end
  end

  describe '#badge_templates_get_single' do
    it 'issues the correct request with ID' do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@client.organization_id}/badge_templates/1")

      @client.badge_templates_get_single(1)

      expect(stub).to have_been_requested
    end
  end
end
