class Group < ActiveRecord::Base
  has_many :events
  has_many :locations, :through => :events
  has_many :ratings, :as => :resource
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  define_index do
    indexes name
  end
  
end
