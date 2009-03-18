# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def map_location loc, locs = []
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([loc.latitude,loc.longitude], 
      locs.empty? || locs.size == 1 ? 16 : 14)

    locs = [loc] + locs
    locs.each do |l| 
      @map.overlay_init(GMarker.new([l.latitude, l.longitude], :title => l.name))
    end

    @map
  end

end
