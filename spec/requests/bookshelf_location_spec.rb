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
    location = bookshelf.location

    visit location_path(location)
    within('.actions') do
      click_link('remove')
    end

    Bookshelf.find(bookshelf.id).location.should be_nil
  end
end
