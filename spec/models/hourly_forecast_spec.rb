require 'rails_helper'

RSpec.describe HourlyForecast, type: :model do
  before :each do
    @hourly_weather_forecast =  {
      "time"=>1564671600,
      "summary"=>"Mostly Cloudy",
      "icon"=>"partly-cloudy-day",
      "precipIntensity"=>0,
      "precipProbability"=>0,
      "temperature"=>72.26,
      "apparentTemperature"=>72.26,
      "dewPoint"=>55.75,
      "humidity"=>0.56,
      "pressure"=>1015.31,
      "windSpeed"=>4.55,
      "windGust"=>5.87,
      "windBearing"=>299,
      "cloudCover"=>0.58,
      "uvIndex"=>3,
      "visibility"=>10,
      "ozone"=>296.4
    }
  end

  it "test attributes" do
    current_weather = HourlyForecast.new(@hourly_weather_forecast )
    expect(current_weather.hour).to eq(9)
    expect(current_weather.icon).to eq("partly-cloudy-day")
    expect(current_weather.temperature).to eq(72.26)
  end
end
