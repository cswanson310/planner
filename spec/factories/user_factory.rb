FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name  'Smith'
    email 'JohnSmith'
    new_password 'test'
    new_password_confirmation 'test'
  end
end
