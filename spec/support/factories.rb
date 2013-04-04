FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}@thoughtworks.com" }
  end
  factory :punch do
    time "2013-02-25 14:30:00"
    user
    kind "IN"
    workday
  end
end
