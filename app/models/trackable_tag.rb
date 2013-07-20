class TrackableTag < ActiveRecord::Base
  belongs_to :tag_category
  belongs_to :trackable
end
