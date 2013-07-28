class TrackablesController < ApplicationController
  def new
    @trackable = Trackable.new
    @track_category_id = params[:track_category_id]
  end

  def create
    @trackable = Trackable.new(safe_params)
    @trackable.user_id = current_user.id
    @trackable.day_id = current_day.id
    if @trackable.save
      flash[:notice] = 'Successfully created trackable'
      redirect_to user_day_path(current_user, current_day)
    else
      render action: 'new'
    end
  end

  private

  def safe_params
    params.require(:trackable).permit(:name, :trackable_qty, :units, :track_category_id)
  end

end
