require 'rails_helper'

RSpec.describe 'Flickr API' do
  it 'can send me a background image by city' do
    VCR.use_cassette('flickr_request') do

      get '/api/v1/backgrounds?location=denver,co'

      expect(response).to be_successful

      background_img = JSON.parse(response.body, symbolize_names: true)

      path = background_img[:data][:attributes][:get_background][:rsp][:photos][:photo]
      attributes = [:id, :owner, :secret, :server, :farm, :title, :ispublic, :isfriend, :isfamily]

      expect(background_img[:data][:id]).to eq('denver,co')
      expect(path.keys).to match_array(attributes)
    end
  end
end
