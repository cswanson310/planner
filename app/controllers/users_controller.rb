class UsersController < ApplicationController

  before_filter :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
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
