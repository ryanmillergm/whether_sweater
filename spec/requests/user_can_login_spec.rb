require 'rails_helper'

RSpec.describe 'Users' do
  it 'can login to account' do
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
