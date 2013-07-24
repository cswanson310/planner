class TrackablesController < ApplicationController
  def new
    @trackable = Trackable.new
    @track_category_id = params[:track_category_id]
    p @track_category_id
  end

  def create
    @trackable = Trackable.new(safe_params)
    @trackable.user_id = current_user.id
    @trackable.day_id = Day.find_or_create_by(user_id: current_user.id, date: Date.today)
    if @trackable.save
      redirect_to user_path(current_user)
    else
      render action: 'new'
    end
  end

  private

  def safe_params
    params.require(:trackable).permit(:name, :trackable_qty, :units, :track_category_id)
  end

end

