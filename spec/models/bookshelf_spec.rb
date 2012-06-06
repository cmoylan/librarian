require 'spec_helper'

describe Bookshelf do
  context ".available" do
    it "should return all available bookshelves" do
      3.times { Factory :bookshelf }
      5.times { Factory :bookshelf_with_location }

      available = Bookshelf.available
      available.count.should == 3
    end
  end

  context "#available?" do
    it "should return true if bookshelf has no location" do
      bookshelf = Factory(:bookshelf)
      location = Factory(:location)

      bookshelf.available?.should be_true

      bookshelf.location = location
      bookshelf.save
      bookshelf.available?.should be_false
    end
  end
end
