class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    user = User.new(user_params)
    if user.save
      api_key = SecureRandom.urlsafe_base64.to_s
      user.update(api_key: api_key)
      render json: {api_key: user.api_key}, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
