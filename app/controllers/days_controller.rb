class DaysController < ApplicationController

  before_filter :set_user, only: [:show]

  def show

  end

  private

  def set_user
    @user = User.friendly.find(params[:user_id])
    @day = Day.find_or_initialize_by(user_id: @user.id, date: Date.today)
  end
end
