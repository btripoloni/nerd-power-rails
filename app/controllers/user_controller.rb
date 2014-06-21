class UserController < ApplicationController
  def index
    cookies[:id_user] = current_user.id
  end

  def profile
    @user = User.find_by!(nickname: params[:nickname])
  end
end
