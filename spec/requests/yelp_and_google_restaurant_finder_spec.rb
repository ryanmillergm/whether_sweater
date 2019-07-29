require 'rails_helper'

RSpec.describe 'Google and Yelp API' do
  describe 'can return the time it takes to get to a location' do
    it 'and list the city and three restaurants' do

      get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese Content-Type: application/json Accept: application/json'

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      binding.pry
    end
  end
end

# Munchies
#
# GET /api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese Content-Type: application/json Accept: application/json
#
# You will use the Google Directions API: https://developers.google.com/maps/documentation/directions/start in order to find out how long it will take to travel from the two locations, and then using the Yelp API, you will find all of the restaurants matching the cuisine, the example here is Chinese, that WILL BE OPEN at your estimated time of arrival.
#
# Your API will return the end city, and three restaurants, along with their name and address.
#
# Technical notes:
#
# The Yelp API only accepts time as UNIX time. You can conert a Time object into UNIX time by doing something like this: Time.now.to_i
#
# You can find out time in the future using a feature built into Rails' ActiveSupport which will let you do things like this: Time.now + 4.hours (This will ONLY work in Rails and not a pry session run from the command line)
