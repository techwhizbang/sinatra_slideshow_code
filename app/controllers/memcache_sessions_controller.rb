class MemcacheSessionsController < Sinatra::Base
  include PageTracker
  set :views, Proc.new { File.expand_path(File.dirname(__FILE__) + "/../views/memcache_sessions") }

  get "/page_visits" do
    increment_page_visits
    erb :memcache_based
  end

end