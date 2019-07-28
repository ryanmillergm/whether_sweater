require 'rails_helper'

RSpec.describe DarkSkyService do
  before :each do
    @coordinates = {
      lat: 39.729431,
      lng: -104.831917
    }
    @forecast_coordinates = Coordinates.new(@coordinates)
    @dark_sky_service = DarkSkyService.new(@forecast_coordinates)
  end

  it 'exists' do
    expect(@dark_sky_service).to be_a(DarkSkyService)
  end
end
