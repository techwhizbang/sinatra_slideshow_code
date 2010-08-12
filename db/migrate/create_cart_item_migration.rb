class CreateCartItemMigration < ActiveRecord::Migration

  def self.connection
    ActiveRecord::Base.establish_connection(
        :adapter  => "sqlite3",
        :database => "sinatra_db.sqlite3"
      ).connection
  end

  def self.up
    create_table(:cart_items) do |t|
      t.column :name, :string
      t.column :description, :string
    end
  end

  def self.down
     drop_table(:cart_items)
  end

end