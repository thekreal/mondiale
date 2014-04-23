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

  def center_of_all_locations(ary)
    Geocoder::Calculations.geographic_center(ary);
  end

  def posts_in_json(posts)
    posts.to_json(
      methods: [:trip_id],
      include: [
        post_attachments: {
          except: [:id, :created_at, :updated_at],
          include: [
            postimage: {
              except: [:created_at, :updated_at]
            }
          ]
        }
      ],
      except: [:postimage, :created_at, :updated_at]
    )
  end

  def plan_items_in_json(plan_items)
    plan_items.to_json
  end
end