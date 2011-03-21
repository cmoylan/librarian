class RelateBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.references :bookshelf
    end

    change_table :checkouts do |t|
      t.references :book
    end
  end

  def self.down
    remove_column :books, :bookshelf
    remove_column :checkouts, :book
  end
end
