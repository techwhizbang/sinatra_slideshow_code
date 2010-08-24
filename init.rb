require 'rubygems'
require 'net/http'
require 'bundler'
Bundler.setup

require 'rack/throttle'
require 'rack/flash'
require 'rack'
require 'rack/cache'
require 'builder'
require 'haml'
require 'erubis'
require 'active_record'
require 'sqlite3'
require 'json'
require 'cafepress-search'
require 'sinatra'
require 'sinatra/respond_to'
require 'sinatra/cache'

lib = Dir.glob(File.expand_path(File.dirname(__FILE__) + "/lib/*.rb"))
models = Dir.glob(File.expand_path(File.dirname(__FILE__) + "/app/models/*"))
helpers = Dir.glob(File.expand_path(File.dirname(__FILE__) + "/app/helpers/*"))
require File.expand_path(File.dirname(__FILE__) + "/app/controllers/page_tracker")
controllers =  Dir.glob(File.expand_path(File.dirname(__FILE__) + "/app/controllers/*"))

lib.each { |l| require l }
models.each {|model| require model}
helpers.each {|helper| require helper}
controllers.each {|controller| require controller}