class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :day

  has_many :note_tags
  has_many :tag_categories, through: :note_tags

end
