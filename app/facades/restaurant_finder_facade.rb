class RestaurantFinderFacade
  def initialize(attributes = {})
    @start = attributes[:start]
    @end = attributes[:end]
    @food = attributes[:food]
    @id = @food
    @restaurants = get_google_travel_time
  end

  def get_google_travel_time
    travel_time = google_directions_service.get_time
  end

  private

  def google_directions_service
    @google_directions ||= GoogleDirectionsService.new(@start, @end, @food)
  end
end
