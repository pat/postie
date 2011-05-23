require 'spec_helper'

describe 'Postie' do
  include Rack::Test::Methods
  
  let(:app) { Postie }
  
  describe '/' do
    it 'should respond to /' do
      get '/'
      
      last_response.should be_ok
    end
  end
  
  describe '/:postcode' do
    it 'should respond to /3000' do
      get '/3000'
      
      last_response.should be_ok
    end
  end
  
  describe '/:suburb' do
    it 'should respond to /Melbourne' do
      get '/Melbourne'
      
      last_response.should be_ok
    end
    
    it "should translate escaped characters" do
      Locality.should_receive(:where).
        with("suburb LIKE '%%%s%%'", 'Fitzroy North')
      
      get '/Fitzroy%20North'
    end
  end
end
