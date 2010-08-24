# To use with thin
# thin start -p PORT -R config.ru
# thin -s 2 -C config.yml -R -R sinatra_code/config.ru start
# thin -s 2 -R sinatra_code/config.ru start

require File.expand_path(File.dirname(__FILE__) + "/init")

use Rack::Static, :urls => ["/stylesheets", "/javascripts", "/images"], :root => "public"
use Rack::CommonLogger
use Rack::Lint

use Rack::Cache do
 set :verbose, true
 set :metastore, 'memcached://localhost:11211/meta'
 set :entitystore, 'memcached://localhost:11211/entity'
end

#Rack:URLMap in action
map "/product" do
  run ProductsController
end

map "/products" do
  run ProductsController
end

map "/standalone" do
  run StandaloneController
end

map "/search" do
  run SearchController
end

map "/cookie_sessions" do
  run CookieSessionsController
end

map "/memcache_sessions" do
  use Rack::Session::Memcache, :servers => 'localhost:11211', :expire_at => 60 * 30
  run MemcacheSessionsController
end

map "/memory_sessions" do
  use Rack::Session::Pool, :expire_after => 60 * 30
  run MemorySessionsController
end