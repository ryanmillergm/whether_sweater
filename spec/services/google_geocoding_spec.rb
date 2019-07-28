require 'rails_helper'

RSpec.describe GoogleGeocodingService do
  before :each do
    @location = 'denver,co'
    @geocoding_service = GoogleGeocodingService.new(@location)
  end

  it 'exists' do
    expect(@geocoding_service).to be_a(GoogleGeocodingService)
  end
end
