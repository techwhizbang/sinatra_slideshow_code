class Database

  class << self

    # You could also do a database.yml config similiar to Rails very easily
    # Better yet, make this a Sinatra extension
    def connect
      ActiveRecord::Base.establish_connection(
        :adapter  => "sqlite3",
        :database => "sinatra_db.sqlite3"
      ).connection
    end

  end

end