class CurrentWeather
  attr_reader :id,
              :time,
              :summary,
              :icon,
              :precip_probablility,
              :temperature,
              :apparent_temperature,
              :humidity,
              :uv_index,
              :visibility

  def initialize(forecast)
    @id = "Current Weather"
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
