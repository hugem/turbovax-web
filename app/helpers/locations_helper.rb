module LocationsHelper
  include Rails.application.routes.url_helpers

  def self.format_appointment_date(date)
    date.strftime("%a, %-m/%-e")
  end

  def self.format_appointment_time(date)
    date.strftime("%-l:%M%p")
  end

  def self.google_maps_url(address)
    "https://www.google.com/maps/search/#{address}"
  end

  def self.enable_reserve_button?(location)
    location.appointment_count.positive?
  end

  def self.last_updated(locations)
    last_updated = locations.map(&:updated_at).max
    last_updated.presence && last_updated.strftime("%b %-e %-l:%M%p")
  end

  def self.total_appointments(locations)
    locations.map(&:appointment_count).sum
  end

  def self.total_locations(locations)
    locations.select { |location| location.appointment_count.positive? }.size
  end
end
