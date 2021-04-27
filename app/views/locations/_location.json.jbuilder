json.extract! location, :id, :uuid, :name, :address, :area, :enabled, :portal_key, :portal_uuid, :latitude, :longitude, :last_available, :created_at, :updated_at
json.url location_url(location, format: :json)
