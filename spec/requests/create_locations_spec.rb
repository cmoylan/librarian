require 'spec_helper'

describe "CreateLocations" do
  it "creates a new location with a name" do
    location = Factory(:location)
    visit new_location_path
    fill_in "Name", :with => location.name
    click_button "Create Location"
    Location.find(location.id).should == location
  end
end
