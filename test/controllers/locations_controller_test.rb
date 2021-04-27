require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get locations_url
    assert_response :success
  end

  test "should get new" do
    get new_location_url
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post locations_url, params: { location: { address: @location.address, area: @location.area, enabled: @location.enabled, last_available: @location.last_available, latitude: @location.latitude, longitude: @location.longitude, name: @location.name, portal_key: @location.portal_key, portal_uuid: @location.portal_uuid, uuid: @location.uuid } }
    end

    assert_redirected_to location_url(Location.last)
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_url(@location)
    assert_response :success
  end

  test "should update location" do
    patch location_url(@location), params: { location: { address: @location.address, area: @location.area, enabled: @location.enabled, last_available: @location.last_available, latitude: @location.latitude, longitude: @location.longitude, name: @location.name, portal_key: @location.portal_key, portal_uuid: @location.portal_uuid, uuid: @location.uuid } }
    assert_redirected_to location_url(@location)
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete location_url(@location)
    end

    assert_redirected_to locations_url
  end
end
