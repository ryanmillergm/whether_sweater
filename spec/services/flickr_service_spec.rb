require 'rails_helper'

RSpec.describe FlickrService do
  before :each do
    @flickr_service = FlickrService.new
  end

  it 'exists' do
    expect(@flickr_service).to be_a(FlickrService)
  end

 it "returns photos" do
   VCR.use_cassette('services/flickr_service', record: :new_episodes) do
     @location = "Denver,CO"
     response = FlickrService.new
     background = response.background_image_by_city(@location)[:rsp][:photos][:photo]
     expect(background).to be_a(Hash)
     expect(background).to have_key(:id)
     expect(background).to have_key(:owner)
     expect(background).to have_key(:title)
   end
 end
end
