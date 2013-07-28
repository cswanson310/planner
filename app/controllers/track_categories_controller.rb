class TrackCategoriesController < ApplicationController
  def new
    @track_category = TrackCategory.new
  end

  def create
    @track_category = TrackCategory.create(safe_params)
    if @track_category.save
      flash[:notice] = "Succesfully Created Category, add trackable to this category?"
      redirect_to new_trackable_path(track_category_id: @track_category.id)
    else
      render action: 'new'
    end
  end

  private

  def safe_params
    params.require(:track_category).permit(:name)
  end

end
