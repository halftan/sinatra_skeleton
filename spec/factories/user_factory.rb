require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email    "test@example.com"
    password "testpassword"
  end
end
