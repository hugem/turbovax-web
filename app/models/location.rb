class Location < ApplicationRecord
  serialize :vaccine_types

  # refactor
  def formatted_appointments
    Array(appointments).map do |appointment|
      appointment_time_zone = appointment["time_zone"] || time_zone
      date = DateTime.parse(appointment["time"])
      if appointment_time_zone
        date = date.in_time_zone(appointment_time_zone)
      end

      date.strftime("%b %-e %-l:%M%p")
    end
  end
end
