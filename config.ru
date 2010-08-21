# To use with thin
# thin start -p PORT -R config.ru
# thin -s 2 -C config.yml -R -R sinatra_code/config.ru start
# thin -s 2 -R sinatra_code/config.ru start

require File.expand_path(File.dirname(__FILE__) + "/init")

use Rack::Static, :urls => ["/stylesheets", "/javascripts", "/images"], :root => "public"
use Rack::CommonLogger
use Rack::Lint

#Rack:URLMap in action
map "/cart" do
  run CartController
end

map "/standalone" do
  run StandaloneController
end

map "/search" do
  run SearchController
end