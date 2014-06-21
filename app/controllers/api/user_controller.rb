module Api
  class UserController < ApplicationController
    def index
      render json: current_user
    end
  end
end