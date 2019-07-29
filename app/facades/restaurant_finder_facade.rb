class RestaurantFinderFacade
  def initialize(attributes = {})
    binding.pry
    @start = attributes[:start]
    @end = attributes[:end]
    @food = attributes[:food]
    @restaurants = something
  end

  def get_google_trave_time
    travil_time = google_directions_service.get_time
  end

  def private goodle_directions_service
    @google_directions ||= GoogleDirectionsService.new()
  end
end
