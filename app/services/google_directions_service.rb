class GoogleDirectionsService
  attr_reader :start,
              :end_point,
              :food

  def initialize(start, end_point, food)
    @start = start
    @end_point = end_point
    @food = food
    @seconds = nil
  end

  def get_time
    fetch_data("https://maps.googleapis.com/maps/api/directions/json?")
  end

  private

  def parameters
    {
      origin: @start,
      destination: @end_point,
      key: ENV['GOOGLE_MAPS_API_KEY']
    }
  end

  def fetch_data(url)
    google_response = Faraday.get(url, parameters)
    travel_time = JSON.parse(google_response.body, symbolize_names: true)[:routes][0][:legs][0][:duration][:value]
  end

  def time_to_seconds(travel_time)
    (Time.now + travel_time).to_i
  end
end
