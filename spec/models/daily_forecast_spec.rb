require 'rails_helper'

RSpec.describe DailyForecast, type: :model do
  before :each do
    @daily_weather_forecast =  {
      "time"=>1564592400,
      "summary"=>"Mostly Cloudy",
      "icon"=>"partly-cloudy-day",
      "precipIntensity"=>0,
      "precipProbability"=>0,
      "temperature"=>84.97,
      "apparentTemperature"=>84.97,
      "dewPoint"=>46.8,
      "humidity"=>0.27,
      "precipType"=>"Rain",
      "pressure"=>1014.93,
      "temperatureHigh"=>86.47,
      "temperatureLow"=>79.42,
      "windSpeed"=>12.55,
      "windGust"=>17.88,
      "windBearing"=>38,
      "cloudCover"=>0.52,
      "uvIndex"=>6,
      "visibility"=>4.472,
      "ozone"=>296.8
    }
  end

  it "test attributes" do
    daily_weather = DailyForecast.new(@daily_weather_forecast )
    expect(daily_weather.day).to eq("Wednesday")
    expect(daily_weather.icon).to eq("partly-cloudy-day")
    expect(daily_weather.summary).to eq("Mostly Cloudy")

    expect(daily_weather.prec_type).to eq("Rain")
    expect(daily_weather.precip_probability).to eq(0)
    expect(daily_weather.temperature_high).to eq(86.47)
    expect(daily_weather.temperature_low).to eq(79.42)
  end
end
