require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe MemcacheSessionsController do
  include Rack::Test::Methods

  def app
    MemcacheSessionsController
  end

  it 'should put page visit count in the rack session' do
    get "/page_visits"
    last_request.env["rack.session"].should == {:page_visits=>1}
  end
  
end