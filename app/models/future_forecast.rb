class FutureForecast
  def initialize(forecast, travel_time)
    @temperature = forecast["temperature"]
    @summary = forecast["summary"]
    @travel_time = Time.at(travel_time).utc.strftime("%H hour %M minute/s")
  end
end
