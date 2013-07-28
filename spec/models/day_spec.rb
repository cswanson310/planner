require 'spec_helper'

describe Day do
  let (:day) { FactoryGirl.build(:day, date: Date.new(2013, 7, 28)) }

  it 'displays formatted' do
    day.display_string.should == "Sunday, July 28"
  end

end
