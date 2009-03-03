# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def map_location loc
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([loc.latitude,loc.longitude],16)
    @map.overlay_init(GMarker.new([loc.latitude,loc.longitude],
#      :title => loc.name, :info_window => loc.description))
      :title => loc.name)) 
    @map
  end

end
