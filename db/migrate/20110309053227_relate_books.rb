class RelateBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.references :bookshelves
    end

    change_table :checkouts do |t|
      t.references :books
    end
  end

  def self.down
    remove_column :books, :bookshelf
    remove_column :checkouts, :books
  end
end
