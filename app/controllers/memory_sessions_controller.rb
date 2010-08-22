class MemorySessionsController < Sinatra::Base
  include PageTracker
  set :views, Proc.new { File.expand_path(File.dirname(__FILE__) + "/../views/memory_sessions") }

  get "/page_visits" do
    increment_page_visits
    erb :memory_based
  end

end