class Location < ActiveRecord::Base
  has_and_belongs_to_many :group
  
  validates_presence_of :name, :longitude, :latitude
  validates_uniqueness_of :name
  validates_numericality_of :longitude, :latitude
end
