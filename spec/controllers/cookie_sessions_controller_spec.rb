require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe CookieSessionsController do
  include Rack::Test::Methods

  def app
    CookieSessionsController
  end

  it 'should put page visit count in the rack session' do
    get "/page_visits"
    last_request.env["rack.session"].should == {:page_visits=>1}
  end

end