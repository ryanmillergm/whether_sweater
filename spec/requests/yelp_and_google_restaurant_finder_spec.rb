require 'rails_helper'

RSpec.describe 'Google and Yelp API' do
  describe 'can return the time it takes to get to a location' do

    it 'and list the city and three restaurants' do
      VCR.use_cassette('google_yelp_request', record: :new_episodes) do

        get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese Content-Type: application/json Accept: application/json'

        result = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
    end
    end
  end
end
