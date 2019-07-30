require 'rails_helper'

RSpec.describe 'Google and Yelp API' do
  describe 'can return the time it takes to get to a location' do
    it 'and list the city and three restaurants' do

      get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese Content-Type: application/json Accept: application/json'

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
    end
  end
end
