require 'rubygems'
require 'active_record'

namespace :db do
  migrations =  Dir.glob(File.expand_path(File.dirname(__FILE__) + "/../../db/migrate/*"))
  migrations.each { |m| require m }
  task :migrate do
    CreateCartItemMigration.migrate(:up)
  end
end