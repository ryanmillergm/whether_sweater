class DarkSkyService
  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def forecast
    fetch_data("https://api.darksky.net/forecast/e977d6ad9df0d1da66363ab4434d9707/#{@coordinates.latitude},#{@coordinates.longitude}")
  end

  private

  def fetch_data(url)
    response = Faraday.get(url)
    JSON.parse(response.body)
  end
end
