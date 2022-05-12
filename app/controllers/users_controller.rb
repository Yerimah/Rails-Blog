class UsersController < ApplicationController
  def index
    @all_users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
