require 'rails_helper'

RSpec.describe 'Forecasts' do
  it 'gets latitude and longitude from geocoding' do
    VCR.use_cassette('forecast_request') do

      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful

      weather = JSON.parse(response.body, symbolize_names: true)

      attributes = [:time, :summary, :icon, :precip_probablility, :temperature, :apparent_temperature, :humidity, :uv_index, :visibility]

      expect(weather[:data][:attributes][:location]).to eq("denver,co")

      expect(weather[:data][:attributes].keys).to match_array([:location, :current_weather, :hourly_forecast, :daily_forecast])
      expect(weather[:data][:attributes][:current_weather].keys).to match_array(attributes)
    end
  end

  it 'gets latitude and longitude from geocoding' do
    VCR.use_cassette('forecast_different_location_request') do

      get '/api/v1/forecast?location=aurora,co'

      expect(response).to be_successful

      weather = JSON.parse(response.body, symbolize_names: true)

      expect(weather[:data][:attributes][:location]).to eq("aurora,co")
    end
  end

end
