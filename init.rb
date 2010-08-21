require 'rubygems'
require 'sinatra'
require 'sinatra/respond_to'
require 'builder'
require 'haml'
require 'erubis'
require 'active_record'
require 'json'
require 'net/http'
require 'rack'
require 'rack/throttle'
require 'cafepress-search'

set :run, false
set :environment, :development

models = Dir.glob(File.expand_path(File.dirname(__FILE__) + "/app/models/*"))
helpers = Dir.glob(File.expand_path(File.dirname(__FILE__) + "/app/helpers/*"))
controllers =  Dir.glob(File.expand_path(File.dirname(__FILE__) + "/app/controllers/*"))

models.each {|model| require model}
helpers.each {|helper| require helper}
controllers.each {|controller| require controller}