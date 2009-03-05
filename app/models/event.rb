class Event < ActiveRecord::Base
  belongs_to :group
  belongs_to :location
  has_many :ratings, :as => :resource
end
