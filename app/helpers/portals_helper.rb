module PortalsHelper
  ALL_PORTALS = [
    Portals::TestPortal,
  ].freeze

  PORTALS_BY_KEY = ALL_PORTALS.each_with_object({}) do |portal, memo|
    memo[portal.key] = portal
  end.freeze

  def self.find_by_key(key)
    PORTALS_BY_KEY[key]
  end
end
