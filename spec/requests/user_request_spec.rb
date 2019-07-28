require 'rails_helper'

RSpec.describe 'Users' do
  it 'can create an account' do

    get '/api/v1/users'

    expect(response).to be_successful

    expect(response).to have_http_status(201)
    binding.pry
  end
end
