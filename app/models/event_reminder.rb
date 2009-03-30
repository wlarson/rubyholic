class EventReminder < ActionMailer::Base
  def mail_to_rsvp rsvp
    subject "Event Reminder"
    recipients rsvp.email
    from 'rubyholic'
    body "Group: #{rsvp.event.group.name}\n" << 
      "Location: #{rsvp.event.location.name}\n" <<
      "Date: #{rsvp.event.date}\n" <<
      "Duration: #{rsvp.event.duration}\n"
  end

end
