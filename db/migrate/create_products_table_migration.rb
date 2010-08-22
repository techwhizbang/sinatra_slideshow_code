class CreateProductsTableMigration < ActiveRecord::Migration

  def self.connection
    Database.connect
  end

  def self.up
    create_table(:products) do |t|
      t.column :name, :string
      t.column :description, :string
    end
  end

  def self.down
     drop_table(:products)
  end

end