class NoteTag < ActiveRecord::Base
  belongs_to :tag_category
  belongs_to :note
end
