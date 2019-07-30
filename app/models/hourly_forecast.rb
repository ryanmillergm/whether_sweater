class HourlyForecast
  def initialize(forecast)
    @time = Time.at(forecast["time"]).hour
    @icon = forecast["icon"]
    @temperature = forecast["temperature"]
  end
end
