class TagCategory < ActiveRecord::Base
  has_many :note_tags
  has_many :trackable_tags
end
