class SearchController < Sinatra::Base

  set :views, Proc.new { File.expand_path(File.dirname(__FILE__) + "/../views/search") }
 
  get "/:query" do
    client = Cafepress::Search::Client.new "vrnhkabx2s2fwjpensdfhv9h"
    @search_results = client.search params[:query]
    haml :show, :layout => true
  end

end