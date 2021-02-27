class DarkSkyService
  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def forecast
    fetch_data("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API']}/#{@coordinates[:lat]},#{@coordinates[:lng]}")
  end

  def future_forecast(arrival_time)
    fetch_data("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API']}/#{@coordinates[:lat]},#{@coordinates[:lng]},#{arrival_time}")
  end

  private

  def fetch_data(url)
    response = Faraday.get(url)
    JSON.parse(response.body)
  end
end
