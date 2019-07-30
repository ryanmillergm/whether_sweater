class DailyForecast
  def initialize(forecast)
    @day = Time.at(forecast["time"]).strftime("%A")
    @icon = forecast["icon"]
    @summary = forecast["summary"]
    @prec_type = forecast["precipType"]
    @precip_probability = forecast["precipProbability"]
    @temperature_high = forecast["temperatureHigh"]
    @temperature_low = forecast["temperatureLow"]
  end
end
