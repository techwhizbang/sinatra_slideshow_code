require 'rubygems'
require 'active_record'

namespace :db do
  require File.expand_path(File.dirname(__FILE__) + "/../../lib/database")
  migrations =  Dir.glob(File.expand_path(File.dirname(__FILE__) + "/../../db/migrate/*"))
  migrations.each { |m| require m }
  task :migrate do
    CreateProductsTableMigration.migrate(:up)
  end
  task :rollback do
    CreateProductsTableMigration.migrate(:down)
  end
  task :drop do
    connection = Database.connect
    connection.tables.each do |table|
      connection.drop_table(table) 
    end
  end
end