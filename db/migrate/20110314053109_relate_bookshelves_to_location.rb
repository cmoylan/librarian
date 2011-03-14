class RelateBookshelvesToLocation < ActiveRecord::Migration
  def self.up
    change_table :bookshelves do |t|
      t.references :locations
    end
  end

  def self.down
    remove_column :bookshelves, :location
  end
end
