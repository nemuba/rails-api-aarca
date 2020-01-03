class WelcomeController < ApplicationController
  def index
    render json: {message: "Welcome AARCA API"}
  end
end
