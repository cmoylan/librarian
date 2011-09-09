require 'spec_helper'

describe Bookshelf do
  it "should tell you if it's available" do
    bookshelf = Factory(:bookshelf)
    location = Factory(:location)

    bookshelf.available?.should be_true

    bookshelf.location = location
    bookshelf.save
    bookshelf.available?.should be_false
  end
end
