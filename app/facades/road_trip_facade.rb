class RoadTripFacade
  attr_accessor :id,
                :api_key,
                :forecast

  def initialize(attributes = {})
    @id = "Destination's forecasted weather upon arrival"
    @origin = attributes[:origin]
    @destination = attributes[:destination]
    @api_key = attributes[:api_key]
    @travel_time = nil
    @coordinates = nil
  end

  def get_road_trip_forecast
    @travel_time = google_direction_service.get_time
    arrival_time = (Time.now + @travel_time).to_i
    @coordinates = google_geocoding_service.location_to_coordinates
    FutureForecast.new(dark_sky_service.future_forecast(arrival_time)["currently"], @travel_time)
  end

  private

  def google_direction_service
    @google_direction_service ||= GoogleDirectionsService.new(@origin, @destination, nil)
  end

  def google_geocoding_service
    @google_geocoding_service ||= GoogleGeocodingService.new(@destination)
  end

  def dark_sky_service
    @dark_sky_service ||= DarkSkyService.new(@coordinates)
  end


end
