require File.expand_path(File.dirname(__FILE__) + "/../helper.rb")

class StandaloneControllerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    StandaloneController
  end

  def test_returns_simple_text
    get "/"
    assert_equal(last_response.body, "Ridiculously simple")
  end

  def test_returns_json_format
    get "/json"
    assert_equal(last_response.body, "{\"something like PI\":3.141}")
  end


  def test_returns_html_from_haml
    get "/haml"
    assert_equal(last_response.body, "<html>\n  <title>Super Simple</title>\n  <body>\n    <strong>Ridiculously simple</strong>\n  </body>\n</html>\n")
  end
end
