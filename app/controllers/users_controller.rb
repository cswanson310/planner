class UsersController < ApplicationController

  before_filter :set_user, only: [:show]

  skip_filter :authorize, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successfully registered!"
      redirect_to user_day_path(@user, current_day)
    else
      render action: 'new'
    end
  end

  protected

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :new_password,
                                 :new_password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
