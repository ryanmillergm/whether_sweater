class ForecastFacade
  def initialize(location)
    @location = location
  end

  def get_coordinates
    coordinates = geocoding_service.location_to_coordinates
    Coordinates.new(coordinates)
  end

  private

  def geocoding_service
    @geocoding = GoogleGeocodingService.new(@location)
  end
end
