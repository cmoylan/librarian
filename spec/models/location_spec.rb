require 'spec_helper'

describe Location do
  it "should have many bookshelves" do
    location = Factory(:location)

    1.upto(10) do
      bookshelf = Factory(:bookshelf)
      bookshelf.location = location
      bookshelf.save
    end

    location.bookshelves.count.should == 10
  end
end
