# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Error do
  subject { @error }

  before do
    @error = described_class.new
  end

  # Class Methods
  describe '.from_response' do
    before do
      @response = double
      @env = double

      allow(@response).to receive(:status).and_return(200)
      allow(@response).to receive(:env).and_return(@env)
      allow(@response).to receive(:body).and_return({})
      allow(@env).to receive(:method).and_return('GET')
      allow(@env).to receive(:url).and_return('https://test.com')
    end

    it 'returns no error with status of 200' do
      allow(@response).to receive(:status).and_return(200)

      @error = described_class.from_response(@response)

      expect(@error).to equal(nil)
    end

    it 'returns BadRequest error with response status of 400' do
      allow(@response).to receive(:status).and_return(400)

      @error = described_class.from_response(@response)

      expect(@error).to be_a(Credly::BadRequest)
    end

    it 'returns Unauthorized error with response status of 401' do
      allow(@response).to receive(:status).and_return(401)

      @error = described_class.from_response(@response)

      expect(@error).to be_a(Credly::Unauthorized)
    end

    it 'returns Forbidden error with response status of 403' do
      allow(@response).to receive(:status).and_return(403)

      @error = described_class.from_response(@response)

      expect(@error).to be_a(Credly::Forbidden)
    end

    it 'returns NotFound error with response status of 404' do
      allow(@response).to receive(:status).and_return(404)

      @error = described_class.from_response(@response)

      expect(@error).to be_a(Credly::NotFound)
    end

    it 'returns Gone error with response status of 410' do
      allow(@response).to receive(:status).and_return(410)

      @error = described_class.from_response(@response)

      expect(@error).to be_a(Credly::Gone)
    end

    it 'returns UnprocessableEntity error with response status of 422' do
      allow(@response).to receive(:status).and_return(422)

      @error = described_class.from_response(@response)

      expect(@error).to be_a(Credly::UnprocessableEntity)
    end

    it 'returns ClientError error with response status > 400 and < 500' do
      allow(@response).to receive(:status).and_return(405)

      @error = described_class.from_response(@response)

      expect(@error).to be_a(Credly::ClientError)
    end

    it 'returns InternalServerError error with response status of 500' do
      allow(@response).to receive(:status).and_return(500)

      @error = described_class.from_response(@response)

      expect(@error).to be_a(Credly::InternalServerError)
    end

    it 'returns ServiceUnavailable error with response status of 503' do
      allow(@response).to receive(:status).and_return(503)

      @error = described_class.from_response(@response)

      expect(@error).to be_a(Credly::ServiceUnavailable)
    end

    it 'returns InternalServerError error with response status > 500 and < 600' do
      allow(@response).to receive(:status).and_return(501)

      @error = described_class.from_response(@response)

      expect(@error).to be_a(Credly::ServerError)
    end
  end

  describe '.initialize' do
    it 'returns a StandardError object' do
      expect(@error).to be_a(StandardError)
    end
  end
end
