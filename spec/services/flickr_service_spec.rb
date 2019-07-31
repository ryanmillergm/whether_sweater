require 'rails_helper'

RSpec.describe FlickrService do
  before :each do
    @flickr_service = FlickrService.new
  end

  it 'exists' do
    expect(@flickr_service).to be_a(FlickrService)
  end

end
