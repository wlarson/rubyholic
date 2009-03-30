class Rsvp < ActiveRecord::Base
  belongs_to :event
  validates_email_format_of :email
end
