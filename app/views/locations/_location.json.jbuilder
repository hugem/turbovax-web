json.extract! location, :id, :uuid, :name, :full_address, :area, :enabled, :portal_key, :portal_id, :latitude, :longitude, :appointments, :last_available, :created_at, :updated_at
json.url location_url(location, format: :json)
