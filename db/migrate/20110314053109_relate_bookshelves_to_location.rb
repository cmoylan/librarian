class RelateBookshelvesToLocation < ActiveRecord::Migration
  def self.up
    remove_column :bookshelves, :location

    change_table :bookshelves do |t|
      t.references :location
    end
  end

  def self.down
    remove_column :bookshelves, :location
  end
end
