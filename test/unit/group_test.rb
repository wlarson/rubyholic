require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  should_not_allow_values_for :name, "'"
  should_have_many :locations, :through => :events

  test "validates presence of name" do
    group = Group.new
    assert ! group.valid?
    assert group.errors.on(:name)
  end

  test "name must be unique" do
    group = Group.new
    group.name = groups(:one).name
    assert ! group.valid?
    assert group.errors.on(:name)
  end



end
