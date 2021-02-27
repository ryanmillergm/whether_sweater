class GoogleGeocodingService
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def location_to_coordinates
    coordinates = fetch_data("https://maps.googleapis.com/maps/api/geocode/json")
    coordinates[:results][0][:geometry][:bounds][:northeast]
  end

  def parameters
    {
      address: @location,
      key: ENV['GOOGLE_MAPS_API_KEY']
    }
  end

  def fetch_data(url)
    response = Faraday.get(url, parameters)
    JSON.parse(response.body, symbolize_names: true)
  end
end
