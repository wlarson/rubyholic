class Location < ActiveRecord::Base
  has_many :events
  has_many :groups, :through => :events
  has_many :ratings, :as => :resource

  validates_presence_of :name, :longitude, :latitude
  validates_uniqueness_of :name
  validates_numericality_of :longitude, :latitude
  
  include Geokit::Geocoders
  acts_as_mappable :lat_column_name => 'latitude', :lng_column_name => 'longitude',
    :auto_geocode=>{:field=>:address, :error_message=>'Could not geocode address'} 

  define_index do
    indexes [name, address], :as => :name, :sortable => :true
  end

end
