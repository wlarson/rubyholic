require 'test_helper'

class LocationTest < ActiveSupport::TestCase

  test "validates presence of name" do
    location = Location.new
    assert ! location.valid?
    assert location.errors.on(:name)
  end

  test "that latitude must be a number" do
    location = locations(:one)
    location.latitude = 'hello world!'
    assert ! location.valid?
    assert location.errors.on(:latitude)
  end
  
  test "that longitude must be a number" do
    location = locations(:one)
    location.longitude = 'hello world!'
    assert ! location.valid?
    assert location.errors.on(:longitude)
  end  



end
