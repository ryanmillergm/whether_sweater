class CurrentWeather
  def initialize(forecast)
    @time = forecast["time"]
    @summary = forecast["summary"]
    @icon = forecast["icon"]
    @precip_probablility = forecast["precipProbablility"]
    @temperature = forecast["temperature"]
    @apparent_temperature = forecast["apparentTemperature"]
    @humidity = forecast["humidity"]
    @uv_index = forecast["uvIndex"]
    @visibility = forecast["visibility"]
  end
end
