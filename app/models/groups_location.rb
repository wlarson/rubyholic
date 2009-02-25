class GroupsLocation < ActiveRecord::Base
  belongs_to :group
  belongs_to :location
  
  validates_presence_of :group_id, :location_id
end
