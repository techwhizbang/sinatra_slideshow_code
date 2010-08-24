class SearchController < Sinatra::Base

  helpers do
    def logger
      LOGGER
    end
  end

  configure do
    LOGGER = Logger.new('search_controller.log', 'daily')
  end
  
  set :root, File.expand_path(File.dirname(__FILE__) + "/../../")  
  set :views, Proc.new { File.join(root, "/app/views/search") }

  register(Sinatra::Cache)
  set :cache_enabled, true
  set :cache_environment, :development
  # If you want full page cache uncomment this and comment out cache_fragments_output_dir
  #set :cache_output_dir, Proc.new { File.join(root, "public", "cache")}
  set :cache_fragments_output_dir, Proc.new { File.join(root, "public", "cache")}
  
  get "/:query" do
    @client = Cafepress::Search::Client.new "vrnhkabx2s2fwjpensdfhv9h"
    logger.info("Looking for #{params[:query]} with the Cafepress Search API")
    haml :show, :layout => true
  end
  
end