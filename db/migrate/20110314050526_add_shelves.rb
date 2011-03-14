class AddShelves < ActiveRecord::Migration
  def self.up
    add_column :bookshelves, :shelves, :integer, :default => 1
    add_column :books, :shelf, :integer
  end

  def self.down
    remove_column :bookshelves, :shelves
    remove_column :books, :shelf
  end
end
