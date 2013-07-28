class NotesController < ApplicationController

  def new
    @note = Note.new(id_params)
  end

  def create
    @note = Note.create(note_params.merge(id_params))
    if @note.save
      flash[:notice] = "Note successfully created"
      redirect_to user_day_path(current_user, current_day)
    else
      render action: 'new'
    end
  end

  private

  def id_params
    {
      user_id: current_user.id,
      day_id: Day.find_by_user_id_and_date(current_user.id, Date.today).id
    }
  end

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
