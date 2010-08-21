class RespondToController < Sinatra::Base

  # There a couple cons to using this extension, 1.) It mucks with the way Sinatra normally finds
  # your templates, 2.) It strips away the normal extension on the incoming requests
  # Room for improvement
  register Sinatra::RespondTo

  # Note that I'd had to "configure" the views for a more Rails-like controller/view mapping
  set :views, Proc.new { File.expand_path(File.dirname(__FILE__) + "/../views/respond_to") }
  
  get "/respond_to" do
    respond_to do |format|
      format.html { haml :show }
      format.xml { builder :show }
      format.json { JSON.generate({"something like PI"=>3.141}) }
    end
  end

end