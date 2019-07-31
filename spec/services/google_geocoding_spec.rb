require 'rails_helper'

RSpec.describe GoogleGeocodingService do
  before :each do
    @location = 'denver,co'
    @geocoding_service = GoogleGeocodingService.new(@location)
  end

  it 'exists' do
    expect(@geocoding_service).to be_a(GoogleGeocodingService)
  end

  it "returns coordinates" do
    VCR.use_cassette('services/google_geocoding_service', record: :new_episodes) do

      coordinates = GoogleGeocodingService.new(@location).location_to_coordinates

      expect(coordinates).to be_a(Hash)
      expect(coordinates).to have_key(:lat)
      expect(coordinates).to have_key(:lng)
    end
  end
end
