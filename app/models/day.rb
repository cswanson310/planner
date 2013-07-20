class Day < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  has_many :trackables
end
