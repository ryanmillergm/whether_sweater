class RoadTripFacade
  attr_accessor :id,
                :api_key,
                :forecast

  def initialize(attributes = {})
    @id = attributes
    @origin = attributes[:origin]
    @destination = attributes[:destination]
    @api_key = attributes[:api_key]
    @forecast = get_road_trip_forecast
    @travel_time = nil
    @coordinates = nil
  end

  def get_road_trip_forecast
    @travel_time = google_direction_service.get_time
    arrival_time = (Time.now + @travel_time).to_i
    @coordinates = google_geocoding_service.location_to_coordinates
    dark_sky_service.future_forecast(arrival_time)
  end

  private

  def google_direction_service
    @google_direction_service ||= GoogleDirectionsService.new(@origin, @destination, nil)
  end

  def google_geocoding_service
    @google_geocoding_service ||= GoogleGeocodingService.new(@destination)
  end

  def yelp_service
    @yelp_service ||= YelpService.new(nil, @distination, @travel_time)
  end

  def dark_sky_service
    @dark_sky_service ||= DarkSkyService.new(@coordinates)
  end
end
