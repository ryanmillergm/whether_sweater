class GoogleDirectionsService
  attr_reader :start,
              :end_point,
              :food

  def initialize(start, end_point, food)
    @start = start
    @end_point = end_point
    @food = food
  end

  def get_time
    fetch_data("https://maps.googleapis.com/maps/api/directions/json?origin=#{@start}&destination=#{@end_point}&key=#{ENV['GOOGLE_MAPS_API_KEY']}")
  end

  private

  def fetch_data(url)
    google_response = Faraday.get(url)
    travel_time = JSON.parse(google_response.body, symbolize_names: true)[:routes][0][:legs][0][:duration][:text].split
    time_to_seconds(travel_time)
    # travel_time_interval_type = JSON.parse(google_response.body, symbolize_names: true)[:routes][0][:legs][0][:duration][:text].split[1]
  end

  def time_to_seconds(travel_time)
    binding.pry
  end
end
# oogle_response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood&key=AIzaSyDXJ9V7QreVlZEn-EPF4yMOrUCFrv4xdow")
#https://maps.googleapis.com/maps/api/directions/json?origin=denver,co&destination=pueblo,co&key=AIzaSyDXJ9V7QreVlZEn-EPF4yMOrUCFrv4xdow
