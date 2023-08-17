require 'spec_helper'

describe "Authorization" do
  it "creates a client instance with a fake access token" do
    client = Credly::Client.new(
      base_url: "https://sandbox-api.credly.com",
      organization_id: "4ceb7c6c-71c1-4836-aaba-0c15323f7e1d",
      access_token: "Fake Token"
    )
    expect(client).to be_an_instance_of(Credly::Client)
  end

  it "creates a client instance with a real access token" do
    client = Credly::Client.new(
      base_url: "https://sandbox-api.credly.com",
      organization_id: "4ceb7c6c-71c1-4836-aaba-0c15323f7e1d",
      access_token: ENV["AUTH_TOKEN"].to_s
    )
    res = client.badges_get
    expect(res.status).to equal(200)
  end
end