require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "should not save without name" do
    location = Location.new :map => ''
    assert !location.save
  end

  test "should not save without map" do
    location = Location.new :name => 'somewhere'
    assert !location.save
  end
end
