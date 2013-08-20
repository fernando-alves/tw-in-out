FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "a#{n}@thoughtworks.com" }
  end

  factory :other_user, class: User do
    sequence(:email) { |n| "b#{n}@thoughtworks.com" }
  end

  factory :punch do
    time "2013-04-04 14:30:00"
    user
    workday
  end

end
