class UsersController < ApplicationController

  before_filter :set_user, only: [:show]

  def show
  end

  protected

  def set_user
    p "setting user!"
    @user = User.find(params[:id])
  end
end
