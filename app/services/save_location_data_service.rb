class SaveLocationDataService
  def initialize(location)
    @location = location
  end

  def execute!
    db_location = Location.find_or_initialize_by(uuid: @location.name, portal_key: @location.portal.key)

    puts db_location.id

    db_location.name = @location.name
    db_location.portal_id = @location.portal_id
    db_location.full_address = @location.full_address
    db_location.area = @location.area
    db_location.time_zone = @location.time_zone
    db_location.vaccine_types = @location.vaccine_types
    if @location.available
      db_location.last_available = DateTime.now
      # db_location.appointments = serialize_appointments(@location.appointments)
      db_location.appointments = @location.appointments
    end

    db_location.save! if db_location.changed?
  end

  private

  def serialize_appointments(appointments)
    # this is a hack
    # JSON.parse(appointments.to_json)
  end
end
