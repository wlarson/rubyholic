require 'test_helper'

class RsvpTest < ActiveSupport::TestCase
  test "validates presence of email" do
    rsvp = Rsvp.new
    assert ! rsvp.valid?
    assert rsvp.errors.on(:email)
  end
end
