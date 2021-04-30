class SaveLocationDataService
  def initialize(location)
    @location = location
  end

  def execute!
    db_location = Location.find_or_initialize_by(uuid: @location.name, portal_key: @location.portal.key)

    db_location.name = @location.name
    db_location.portal_id = @location.portal_id
    db_location.full_address = @location.full_address
    db_location.area = @location.area
    db_location.time_zone = @location.time_zone
    db_location.vaccine_types = @location.vaccine_types
    if @location.available
      db_location.last_available_at = DateTime.now
      db_location.appointments = @location.appointments
      db_location.appointment_count = @location.appointment_count
    end

    db_location.save! if db_location.changed?
  end

end
