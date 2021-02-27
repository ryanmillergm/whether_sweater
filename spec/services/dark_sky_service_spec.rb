require 'rails_helper'

RSpec.describe DarkSkyService do
  before :each do
    @coordinates = {
      lat: 39.729431,
      lng: -104.831917
    }
    @dark_sky_service = DarkSkyService.new(@coordinates)
  end

  it 'exists' do
    expect(@dark_sky_service).to be_a(DarkSkyService)
  end

  it "forecast" do
    VCR.use_cassette('services/dark_sky_service', record: :new_episodes) do
      keys = [
        "time",
       "summary",
       "icon",
       "nearestStormDistance",
       "nearestStormBearing",
       "precipIntensity",
       "precipProbability",
       "temperature",
       "apparentTemperature",
       "dewPoint",
       "humidity",
       "pressure",
       "windSpeed",
       "windGust",
       "windBearing",
       "cloudCover",
       "uvIndex",
       "visibility",
       "ozone"
     ]
      response = DarkSkyService.new(@coordinates)
      weather = response.forecast["currently"]
      expect(weather).to be_a(Hash)
      expect(weather.keys).to match_array(keys)
    end
  end
end
