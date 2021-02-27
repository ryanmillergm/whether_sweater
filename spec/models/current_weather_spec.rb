require 'rails_helper'

RSpec.describe CurrentWeather, type: :model do
  before :each do
    @time = Time.now
    @current_weather_hash = {
      "time"=>1564592755,
      "summary"=>"Mostly Cloudy",
      "icon"=>"partly-cloudy-day",
      "nearestStormDistance"=>291,
      "nearestStormBearing"=>282,
      "precipIntensity"=>0,
      "precipProbability"=>0,
      "temperature"=>84.58,
      "apparentTemperature"=>84.58,
      "dewPoint"=>49,
      "humidity"=>0.29,
      "pressure"=>1014.83,
      "windSpeed"=>11.01,
      "windGust"=>16.42,
      "windBearing"=>44,
      "cloudCover"=>0.51,
      "uvIndex"=>6,
      "visibility"=>4.304,
      "ozone"=>297.3
    }
  end

  it "test attributes" do
    current_weather = CurrentWeather.new(@current_weather_hash )
    expect(current_weather.time).to eq("11:05 AM, 7/31")
    expect(current_weather.summary).to eq("Mostly Cloudy")
    expect(current_weather.icon).to eq("partly-cloudy-day")
    expect(current_weather.precip_probablility).to eq(0)
    expect(current_weather.temperature).to eq(84.58)
    expect(current_weather.apparent_temperature).to eq(84.58)
    expect(current_weather.humidity).to eq(0.29)
    expect(current_weather.uv_index).to eq(6)
    expect(current_weather.visibility.round(2)).to eq(4.30)
  end
end
