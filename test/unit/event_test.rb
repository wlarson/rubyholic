require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "upcoming includes future events" do
    future_event = Event.create :date => -3.days.ago, :group => groups(:one), :location => locations(:one)
    assert Event.upcoming.include?(future_event)
  end
  
  test "upcoming excludes past events" do
    past_event = Event.create :date => 3.days.ago, :group => groups(:one), :location => locations(:one)
    assert !Event.upcoming.include?(past_event)
  end

end
