class GoogleGeocodingService
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def location_to_coordinates
    fetch_data("https://maps.googleapis.com/maps/api/geocode/json?address=#{@location}&key=#{ENV['GEOCODING_API']}")[:results][0][:geometry][:bounds][:northeast]
  end

  def fetch_data(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end 
