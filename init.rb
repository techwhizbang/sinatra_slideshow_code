require 'rubygems'
require 'memcache'
require 'rack'
require 'rack/throttle'
require 'rack/session/memcache'
require 'builder'
require 'haml'
require 'erubis'
require 'active_record'
require 'json'
require 'net/http'
require 'cafepress-search'
require 'sinatra'
require 'sinatra/respond_to'

lib = Dir.glob(File.expand_path(File.dirname(__FILE__) + "/lib/*.rb"))
models = Dir.glob(File.expand_path(File.dirname(__FILE__) + "/app/models/*"))
helpers = Dir.glob(File.expand_path(File.dirname(__FILE__) + "/app/helpers/*"))
require File.expand_path(File.dirname(__FILE__) + "/app/controllers/page_tracker")
controllers =  Dir.glob(File.expand_path(File.dirname(__FILE__) + "/app/controllers/*"))

lib.each { |l| require l }
models.each {|model| require model}
helpers.each {|helper| require helper}
controllers.each {|controller| require controller}