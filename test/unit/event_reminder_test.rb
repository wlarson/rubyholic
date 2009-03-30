require 'test_helper'

class EventReminderTest < ActionMailer::TestCase
  def test_mail_to_rsvp
    response = EventReminder.create_mail_to_rsvp(rsvps(:one)) 
    assert_equal(rsvps(:one).email, response.to[0]) 
    assert_match(rsvps(:one).event.group.name, response.body) 
  end 
end
