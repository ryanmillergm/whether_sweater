require 'rails_helper'

RSpec.describe 'Forecasts' do
  it 'gets latitude and longitude from geocoding' do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    weather = JSON.parse(response.body, symbolize_names: true)

    expect(weather[:data][:attributes][:location]).to eq("denver,co")
  end

  it 'gets latitude and longitude from geocoding' do

    get '/api/v1/forecast?location=aurora,co'

    expect(response).to be_successful

    weather = JSON.parse(response.body, symbolize_names: true)

    expect(weather[:data][:attributes][:location]).to eq("aurora,co")
  end

end
