require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Database do

  it 'should return a connection to the database' do
    ActiveRecord::Base.should_receive(:establish_connection).with({:database=>"sinatra_db.sqlite3", :adapter=>"sqlite3"}).
      and_return(stub('database', :connection => stub))
    Database.connect
  end

end