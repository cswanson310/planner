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
      day = Day.find_or_create_by(user_id: @user.id, date: Date.today)
      redirect_to user_day_path(@user, day)
    else
      p "Errors! #{@user.errors.messages}"
      render action: 'new'
    end
  end

  def show
    @day = Day.find_or_create_by_date_and_user_id(Date.today, @user.id)
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
