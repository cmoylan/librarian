class AddCoordsToBookshelves < ActiveRecord::Migration
  def up
    add_column :bookshelves, :x1, :integer
    add_column :bookshelves, :y1, :integer
    add_column :bookshelves, :x2, :integer
    add_column :bookshelves, :y2, :integer
  end

  def down
    remove_column :bookshelves, :x1
    remove_column :bookshelves, :y1
    remove_column :bookshelves, :x2
    remove_column :bookshelves, :y2
  end
end
