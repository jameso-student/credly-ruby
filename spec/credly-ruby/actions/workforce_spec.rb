# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Actions::Workforce do
  subject { @client }

  before do
    @client = Credly::Client.new(auth_token: 'token')
    @organization_id = 1
  end

  describe '#employee_list' do
    it 'issues the correct GET request without query params' do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/employees")

      @client.employee_list(@organization_id)

      expect(stub).to have_been_requested
    end

    it 'issues the correct GET request with query params' do
      query_params = {
        filter: 'state::accepted|names_or_email::johndoe@gmail.com',
        sort: 'email',
        page: 1
      }

      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/employees")
             .with(query: query_params)

      @client.employee_list(@organization_id, query_params)

      expect(stub).to have_been_requested
    end
  end
end
