class CurrentWeather
  attr_reader :time,
              :summary,
              :icon,
              :precip_probablility,
              :temperature,
              :apparent_temperature,
              :humidity,
              :uv_index,
              :visibility
              
  def initialize(forecast)
    @time = format_time(forecast["time"])
    @summary = forecast["summary"]
    @icon = forecast["icon"]
    @precip_probablility = forecast["precipProbability"]
    @temperature = forecast["temperature"]
    @apparent_temperature = forecast["apparentTemperature"]
    @humidity = forecast["humidity"]
    @uv_index = forecast["uvIndex"]
    @visibility = forecast["visibility"]
  end

  def format_time(time_in_seconds)
    time = Time.at(time_in_seconds)
    "#{time.strftime("%l:%M %p")}, #{time.month}/#{time.day}"
  end
end
