class HourlyForecast
  attr_reader :hour,
              :icon,
              :temperature
              
  def initialize(forecast)
    @hour = Time.at(forecast["time"]).hour
    @icon = forecast["icon"]
    @temperature = forecast["temperature"]
  end
end
