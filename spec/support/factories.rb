FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}@gmail.com" }
  end
end
