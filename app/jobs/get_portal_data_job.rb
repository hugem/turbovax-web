class GetPortalDataJob
  include Sidekiq::Worker

  def perform(portal_string)
    locations = Turbovax::DataFetcher.new(portal_string.constantize).execute!
    locations.each do |location|
      SaveLocationDataService.new(location).execute!
    end

    true
  end
end
