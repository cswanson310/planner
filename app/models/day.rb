class Day < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  has_many :trackables

  extend FriendlyId
  friendly_id :date

  def display_string
    date.strftime("%A, %B %d")
  end
end
