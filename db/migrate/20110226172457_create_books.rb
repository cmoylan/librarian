class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string    :isdn
      t.string    :title
      t.string    :author

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
