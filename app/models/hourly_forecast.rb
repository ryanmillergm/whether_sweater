class HourlyForecast
  def initialize(forecast)
    @hour = Time.at(forecast["time"]).hour
    @icon = forecast["icon"]
    @temperature = forecast["temperature"]
  end
end
