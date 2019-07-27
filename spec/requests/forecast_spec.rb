require 'rails_helper'

RSpec.describe 'Forecasts' do
  it 'gets latitude and longitude from geocoding' do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    binding.pry
  end
end 
