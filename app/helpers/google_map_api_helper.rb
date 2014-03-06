module GoogleMapApiHelper

  def google_api_url
    "https://maps.googleapis.com/maps/api/js"
  end

  def google_maps_api_key
    "AIzaSyD8krFfDfDAa2DxTzMgpWTTdbzoqTRsDKI"
  end

  def google_api_access
    "#{google_api_url}?key=#{google_maps_api_key}&libraries=geometry&sensor=true"
  end

end