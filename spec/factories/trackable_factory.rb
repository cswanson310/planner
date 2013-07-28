FactoryGirl.define do
  factory :trackable do
    user_id 1
    day_id 1
    name 'test'
    trackable_qty 1
    units 'cms'
    track_category_id 1
  end
end
