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
    fetch_data("https://maps.googleapis.com/maps/api/directions/json?origin=#{@start}&destination=#{@end_point}&key=#{ENV['GOOGLE_MAPS_API_KEY']}")
  end

  private

  def fetch_data(url)
    google_response = Faraday.get(url)
    travel_time = JSON.parse(google_response.body, symbolize_names: true)[:routes][0][:legs][0][:duration][:text].split
    time_to_seconds(travel_time)
  end

  def time_to_seconds(travel_time)
    if travel_time[1] == "hour"
      (travel_time[0].to_i * 60 * 60) + (travel_time[2].to_i * 60 )
    elsif travel_time[1] ==  "mins"
      travel_time[0] * 60
    end
  end
end
# oogle_response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood&key=AIzaSyDXJ9V7QreVlZEn-EPF4yMOrUCFrv4xdow")
#https://maps.googleapis.com/maps/api/directions/json?origin=denver,co&destination=pueblo,co&key=AIzaSyDXJ9V7QreVlZEn-EPF4yMOrUCFrv4xdow
