class Event < ActiveRecord::Base
  belongs_to :group
  belongs_to :location
  has_many :ratings, :as => :resource

  named_scope :upcoming, :conditions => ['date > ?', 0.days.ago], :order => 'date ASC'

 # figure this out.  group.events.next would be sweet.
 # alias self.next self.upcoming.first
  
end
