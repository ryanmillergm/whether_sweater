require 'rails_helper'

RSpec.describe 'Users' do
  it 'can login to account' do
    VCR.use_cassette('user_login_request') do
      user = User.create(email: "whatever@example.com", password: "password", api_key: "jgn983hy48thw9begh98h4539h4" )

      api_key = {
        api_key: user.api_key
      }

      body = {
          email: "whatever@example.com",
          password: "password"
        }

      post '/api/v1/sessions', params: body

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(result).to eq(api_key)
    end
  end

  it 'cannot login to account with wrong email' do
    user = User.create(email: "whatevs@example.com", password: "password", api_key: "jgn983hy48thw9begh98h4539h4" )

    api_key = {
      api_key: user.api_key
    }

    body = {
        email: "whatever@example.com",
        password: "password"
      }

    post '/api/v1/sessions', params: body

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(401)
    expect(result[:message]).to eq("email or password was invalid")
  end

  it 'cannot login to account with wrong password' do
    user = User.create(email: "whatever@example.com", password: "Password", api_key: "jgn983hy48thw9begh98h4539h4" )

    api_key = {
      api_key: user.api_key
    }

    body = {
        email: "whatever@example.com",
        password: "password"
      }

    post '/api/v1/sessions', params: body

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(401)
    expect(result[:message]).to eq("email or password was invalid")
  end
end
