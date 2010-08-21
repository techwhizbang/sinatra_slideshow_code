require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe SearchController do
  include Rack::Test::Methods

  def app
    SearchController
  end

  before do
    @search_client = Cafepress::Search::Client.new "123456"
  end

  it 'should hit the search URL' do
    Cafepress::Search::Client.stub!(:new).and_return(@search_client)
    @search_client.stub!(:search)
    get "/sinatra"
    last_request.url.should match(/\/sinatra/)
  end

  it 'should initialize a new Cafepress Search client' do
    @search_client.stub!(:search)
    Cafepress::Search::Client.should_receive(:new).and_return(@search_client)
    get "/ruby"
  end

  it 'should the Cafepress Search client should search by the specified query param' do
    Cafepress::Search::Client.stub!(:new).and_return(@search_client)
    @search_client.should_receive(:search).with("clojure")
    get "/clojure"
  end

end