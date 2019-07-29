require 'rails_helper'

RSpec.describe 'Users' do
  it 'can create an account' do

    body = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }

    post '/api/v1/users', params: body

    expect(response).to be_successful

    api_key = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(201)
    expect(api_key).to have_key(:api_key)
  end

  it 'will not create account if requirements not met' do
    body = {
      email: "whatever@example.com",
      password: "Password",
      password_confirmation: "password"
    }

    post '/api/v1/users', params: body

    expect(response.status).to eq(401)
  end
end
