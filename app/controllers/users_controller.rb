class UsersController < ApplicationController

  def show
    @user = User.find(params[:id] || params[:format])
  end

  def params_user
    params.require(:user).permit(:id)
  end

end
