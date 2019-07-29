class RestaurantFinderFacade
  attr_reader :start,
              :end,
              :food,
              :id,
              :travel_time,
              :restaurants
              
  def initialize(attributes = {})
    @start = attributes[:start]
    @end = attributes[:end]
    @food = attributes[:food]
    @id = @food
    @travel_time = nil
    @restaurants = get_restaurants
  end

  def get_restaurants
    @travel_time = google_directions_service.get_time
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
