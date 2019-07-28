require 'rails_helper'

RSpec.describe 'Flickr API' do
  it 'can send me a background image by city' do

    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    background_img = JSON.parse(response.body, symbolize_names: true)

    
  end
end
