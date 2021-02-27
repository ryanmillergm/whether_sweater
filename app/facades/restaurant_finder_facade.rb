class RestaurantFinderFacade
  attr_reader :end,
              :id

  def initialize(attributes = {})
    @start = attributes[:start]
    @end = attributes[:end]
    @food = attributes[:food]
    @id = @food
    @travel_time = nil
  end

  def get_restaurants
    travel_time = google_directions_service.get_time
    @travel_time = (Time.now + travel_time).to_i
    yelp_service.get_restaurant_list
  end

  private

  def google_directions_service
    @google_directions ||= GoogleDirectionsService.new(@start, @end, @food)
  end

  def yelp_service
    @yelp_services ||= YelpService.new(@food, @end, @travel_time)
  end
end
