require 'test_helper'

class BookshelfTest < ActiveSupport::TestCase
  test "should not save without name" do
    bookshelf = Bookshelf.new
    assert !bookshelf.save
  end

  test "should display name" do
    bookshelf = Bookshelf.new :name => 'le bookshelf'
    assert_equal bookshelf.display_name, 'le bookshelf'
  end
end
