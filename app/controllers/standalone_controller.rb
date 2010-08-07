class StandaloneController < Sinatra::Base

  # Note that I'd had to "configure" the views for a more Rails-like controller/view mapping
  set :views, Proc.new { File.expand_path(File.dirname(__FILE__) + "/../views/standalone") }

  get "/" do
    "Ridiculously simple"
  end

  get "/haml" do
    haml :show
  end

  get "/builder" do
    content_type 'application/xml', :charset => 'utf-8'
    builder :show
  end

  get "/json" do
    content_type 'application/json'
    JSON.generate({"something like PI"=>3.141})
  end

  get "/erubis" do
    erubis :show
  end

  # TODO: build an extension on Sinatra such that it recognizes the requested
  # content type automatically like Rails respond_to { |format| ... }

end