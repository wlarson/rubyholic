require 'test_helper'

class GroupsLocationTest < ActiveSupport::TestCase

  test "validates presence of group_id" do
    gl = GroupsLocation.new
    assert ! gl.valid?
    assert gl.errors.on(:group_id)
  end

  test "validates presence of location_id" do
    gl = GroupsLocation.new
    assert ! gl.valid?
    assert gl.errors.on(:location_id)
  end
  
end
