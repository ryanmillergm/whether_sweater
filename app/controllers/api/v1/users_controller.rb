class Api::V1::UsersController < ApplicationController
  def index
    # render json: UsersSerializer(User.new)
  end

  def create
    user = User.new(user_params)
    if user.save
      user.api_key = SecureRandom.urlsafe_base64.to_s
      render json: {api_key: user.api_key}, status: :created
    elsif
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def set_api

  end
end
