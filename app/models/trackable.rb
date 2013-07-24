class Trackable < ActiveRecord::Base
  belongs_to :user
  belongs_to :day
  belongs_to :track_category

  has_many :trackable_tags
  has_many :tag_categories, through: :trackable_tags
end
