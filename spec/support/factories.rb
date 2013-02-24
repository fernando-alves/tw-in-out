FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}@gmail.com" }
    password "********"
  end
end
