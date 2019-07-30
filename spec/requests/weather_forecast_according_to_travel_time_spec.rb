require 'rails_helper'

RSpec.describe "Google and Weather API" do
  it "can forecast the weather of a location at the time of expected arrival" do

    body = { origin: "Denver,CO",
      destination: "Pueblo,CO",
      api_key: "jgn983hy48thw9begh98h4539h4"
    }

    post '/api/v1/road_trip', params: body

    expect(response).to be_successful
    binding.pry
  end
end
