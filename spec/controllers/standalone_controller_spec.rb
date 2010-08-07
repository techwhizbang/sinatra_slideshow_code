require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe StandaloneController do
  include Rack::Test::Methods

  def app
    StandaloneController
  end

  it 'should return simple text' do
    get "/"
    last_response.body.should == "Ridiculously simple"
  end

  it 'should return JSON' do
    get "/json"
    last_response.body.should == "{\"something like PI\":3.141}"
  end

  it 'should return HTML from a HAML template' do
    get "/haml"
    last_response.body.should == "<html>\n  <title>Super Simple</title>\n  <body>\n    <strong>Ridiculously simple</strong>\n  </body>\n</html>\n" 
  end

  it 'should return XML from a Builder template' do
    get "/builder"
    last_response.body.should == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<sinatra>\n  <rocks>Ridiculously Simple, well sort of...(the automagic xml variable is not documented)</rocks>\n</sinatra>\n"
  end

  it 'should return HTML from a Erubis template' do
    get "/erubis"
    last_response.body.should == "Erubis - I'm faster than Erb"
  end
end