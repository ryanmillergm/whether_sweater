require 'rails_helper'

RSpec.describe 'Forecasts' do
  it 'gets latitude and longitude from geocoding' do

    get '/api/v1/forecast?location=denver,co'
    binding.pry
    expect(response).to be(successful)

    expect(response).to eq(39.739235, -104.990250)
  end
end
