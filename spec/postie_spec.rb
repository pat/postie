require 'spec_helper'

describe 'Postie' do
  include Rack::Test::Methods

  let(:app) { Postie }

  describe '/' do
    it 'should respond to /' do
      get '/'

      expect(last_response).to be_ok
    end
  end

  describe '/:postcode' do
    it 'should respond to /3000' do
      get '/3000'

      expect(last_response).to be_ok
    end
  end

  describe '/:suburb' do
    it 'should respond to /Melbourne' do
      get '/Melbourne'

      expect(last_response).to be_ok
    end

    it "should translate escaped characters" do
      get '/Fitzroy%20North'

      expect(last_response.body).to include("FITZROY NORTH")
    end
  end
end
