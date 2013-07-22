class NotesController < ApplicationController

  def new
    p id_params
    @note = Note.new(id_params)
    p @note.day_id
  end

  def create
    @note = Note.create(note_params.merge(id_params))
    if @note.save
      redirect_to user_path(current_user)
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
