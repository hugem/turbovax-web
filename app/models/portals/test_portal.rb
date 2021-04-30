class Portals::TestPortal < Turbovax::Portal
  name "Gotham City Clinic"
  key "gotham_city"
  public_url "https://www.turbovax.info/"
  api_url "http://api.turbovax.info/v1/test.json"
  api_url_variables do
    data_fetcher_params
  end
  request_http_method Turbovax::Constants::GET_REQUEST_METHOD

  parse_response do |response|
    response_json = JSON.parse(response)
    Array(response_json["appointments"]).map do |location_json|
      appointments = Array(location_json["slots"]).map do |appointment_string|
        {
          time: DateTime.parse(appointment_string)
        }
      end

      Turbovax::Location.new(
        name: location_json["clinic_name"],
        full_address: location_json["address"],
        portal_id: location_json["clinic_id"],
        time_zone: "America/New_York",
        data: {
          vaccine_types: [location_json["vaccine"]],
          appointments: appointments,
        }
      )
    end
  end
end
