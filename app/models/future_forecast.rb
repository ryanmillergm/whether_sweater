class FutureForecast
  def initialize(forecast, travel_time)
    @temperature = forecast["temperature"]
    @summary = forecast["summary"]
    @travel_time = Time.at(travel_time).utc.strftime("%H hour %M minute/s")
  end
end

# You will use the Google Directions
# API: https://developers.google.com/maps/documentation/directions/start
# in order to find out how long it will take to travel from the two locations,
#  and then deliver the weather forecast for the hour of arrival. For example,
#  Denver to Pueblo would take two hours. You will deliver a forecast two hours
#  in the future that includes the temperature and summary, and estimated travel
#  time.
