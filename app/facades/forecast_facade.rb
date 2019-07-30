class ForecastFacade
  attr_reader :location,
              :id

  attr_accessor :forecast

  def initialize(location)
    @location = location
    @forecast_coordinates
    @id = "Weather"
    @forecast = get_coordinates
  end

  def get_coordinates
    coordinates = geocoding_service.location_to_coordinates
    @forecast_coordinates = geocoding_service.location_to_coordinates
  end

  def current_weather
     CurrentWeather.new(dark_sky_service.forecast["currently"])
  end

  def hourly_forecast
    hourly_forecast = dark_sky_service.forecast["hourly"]["data"]
    hourly_forecast.first(8).map do |forecast|
      HourlyForecast.new(forecast)
    end
  end

  def daily_forecast
    daily_forecast = dark_sky_service.forecast["daily"]["data"]
    daily_forecast.first(5).map do |forecast|
      DailyForecast.new(forecast)
    end
  end

  private

  def geocoding_service
    @geocoding ||= GoogleGeocodingService.new(@location)
  end

  def dark_sky_service
    @dark_sky ||= DarkSkyService.new(@forecast_coordinates)
  end
end
