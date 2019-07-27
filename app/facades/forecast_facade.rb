class ForecastFacade
  def initialize(location)
    @location = location
    @forecast_coordinates
  end

  def get_coordinates
    coordinates = geocoding_service.location_to_coordinates
    @forecast_coordinates = Coordinates.new(coordinates)
    get_forecast
  end

  def get_forecast
    forecast = dark_sky_service.forecast
  end

  private

  def geocoding_service
    @geocoding ||= GoogleGeocodingService.new(@location)
  end

  def dark_sky_service
    @dark_sky ||= DarkSkyService.new(@forecast_coordinates)
  end
end
