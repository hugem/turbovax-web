class Location < ApplicationRecord
  serialize :vaccine_types

  # https://bigbinary.com/blog/rails-6-1-adds-nulls-first-and-nulls-last-to-arel
  scope :sort_by_last_available, -> { order(Location.arel_table[:last_available_at].desc.nulls_last) }

  def portal
    PortalsHelper.find_by_key(portal_key)
  end

  def parsed_appointments_by_date
    parsed_appointments = Array(appointments).map do |appointment|
      appointment_time_zone = appointment["time_zone"] || time_zone
      date = DateTime.parse(appointment["time"])
      if appointment_time_zone
        date = date.in_time_zone(appointment_time_zone)
      end
    end.sort

    parsed_appointments.group_by do |appointment|
      appointment.at_beginning_of_day
    end
  end
end
