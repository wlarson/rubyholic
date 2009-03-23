# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def map_location locs
    locs = [locs] unless locs.is_a? Array
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    markers = locs.map {|l| GMarker.new([l.latitude, l.longitude], :title => l.name)}
    markers.each {|marker| @map.overlay_init(marker) }
    @map.center_zoom_on_bounds_init(markers.map {|m| m.point})
    @map
  end

  def search query
    search_results = ThinkingSphinx::Search.search(query)
  end
  
end
