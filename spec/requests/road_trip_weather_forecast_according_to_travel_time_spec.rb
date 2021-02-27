require 'rails_helper'

RSpec.describe "Google and Weather API" do
  before :each do
    @user = User.create(email: "whatever@example.com", password: "password", api_key: "jgn983hy48thw9begh98h4539h4" )
    allow(Time).to receive(:now).and_return(Time.at(1564593489))
  end

  it "can forecast the weather of a location at the time of expected arrival" do
    VCR.use_cassette('road_trip_request', record: :new_episodes) do

      body = { origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: "jgn983hy48thw9begh98h4539h4"
      }

      post '/api/v1/road_trip', params: body

      expect(response).to be_successful
      forecast = JSON.parse(response.body, symbolize_names: true)

      attributes = [:temperature, :summary, :travel_time]

      expect(forecast[:data][:id]).to eq("Destination's forecasted weather upon arrival")

      expect(forecast[:data][:attributes][:get_road_trip_forecast].keys).to match_array(attributes)
    end
  end

  it "can forecast the weather of a location at the time of expected arrival" do
    VCR.use_cassette('road_trip_different_location_request', record: :new_episodes) do

      body = { origin: "Denver,CO",
        destination: "Aurora,CO",
        api_key: "jgn983hy48thw9begh98h4539h4"
      }

      post '/api/v1/road_trip', params: body

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)
    end
  end

  it "will give error if users api key is not valid" do

    body = { origin: "Denver,CO",
      destination: "Pueblo,CO",
      api_key: "fake"
    }

    post '/api/v1/road_trip', params: body

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(401)
    expect(result[:message]).to eq("credentials were bad")
  end

  it "will give you the current weather" do

  end
end
