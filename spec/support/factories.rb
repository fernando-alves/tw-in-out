FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}@thoughtworks.com" }
  end
  factory :punch do
    time "2013-02-25 14:25:06"
    user
    kind "IN"
  end
end
