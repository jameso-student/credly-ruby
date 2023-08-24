require 'spec_helper'

RSpec.describe Credly::Actions::Badges do
  subject { @client }

  before do
    @client = Credly::Client.new(organization_id: "id", access_token: "token")
  end

  describe "#badges" do
    it "issues the correct request with query params" do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@client.organization_id}/badges")
                .with(query: {filter: "query::FakePerson"})

      @client.badges_get({filter: 'query::FakePerson'})

      expect(stub).to have_been_requested
    end
  end

end