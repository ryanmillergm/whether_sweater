class RestaurantFinderFacade
  def initialize(attributes = {})
    @start = attributes[:start]
    @end = attributes[:end]
    @food = attributes[:food]
    @id = @food
    @restaurants = get_restaurants
  end

  def get_restaurants
    travel_time = google_directions_service.get_time
    yelp_service.get_restaurant_list(@food, @end, travel_time)
  end

  private

  def google_directions_service
    @google_directions ||= GoogleDirectionsService.new(@start, @end, @food)
  end

  def yelp_service
    @yelp_services ||= YelpService
  end
end
