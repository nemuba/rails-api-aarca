class AuthController < ApplicationController
  before_action :authenticate_user

  def current
    render json: {user: {id: current_user.id, email: current_user.email}}
  end
end