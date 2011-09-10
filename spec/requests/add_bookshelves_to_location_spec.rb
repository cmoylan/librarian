require 'spec_helper'

describe "BookshelfLocation" do
  it "assigns a bookshelf to a location" do
    location = Factory(:location)
    bookshelves = []
    1.upto(5) do
      bookshelves << Factory(:bookshelf)
    end

    visit location_path(location)
    select "shelfy1"
    click_button "Assign to location"

    location.bookshelves.count.should == 1
  end

  it "removes a bookshelf from a location" do
    bookshelf = Factory(:bookshelf_with_location)
    #assert false
  end
end
