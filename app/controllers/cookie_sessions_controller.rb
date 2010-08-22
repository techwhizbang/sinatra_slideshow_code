class CookieSessionsController < Sinatra::Base
  include PageTracker
  set :views, Proc.new { File.expand_path(File.dirname(__FILE__) + "/../views/cookie_sessions") }
  enable :sessions

  get "/page_visits" do
    increment_page_visits
    erb :cookie_based
  end

end