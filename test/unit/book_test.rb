require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "should not save without author" do
    book = Book.new :title => 'something'
    assert !book.save
  end

  test "should not save without title" do
    book = Book.new :author => 'someone'
    assert !book.save
  end
end
