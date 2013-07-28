class DaysController < ApplicationController

  before_filter :set_user_and_day, only: [:show]

  def show
  end

  private

  def set_user_and_day
    @user = User.friendly.find(params[:user_id])
    @day = User.friendly.find(params[:id])
  end
end
