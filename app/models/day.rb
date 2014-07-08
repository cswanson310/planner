class Day < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  has_many :trackables

  def to_param
    "#{date.strftime('%m-%d-%y')}"
  end

  def display_string
    date.strftime("%A, %B %d")
  end
end
