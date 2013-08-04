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

  factory :other_punch, class: Punch do
    time "2013-04-04 14:30:00"
    user {create :other_user}
    workday {create :other_workday}
  end

  factory :punch_on_june, class: Punch do
    time "2013-06-04 09:30:00"
    user
    workday
  end

  factory :another_punch_on_june, class: Punch do
    time "2013-06-08 12:30:00"
    user
    workday
  end

  factory :punch_on_july, class: Punch do
    time "2013-07-30 10:00:00"
    user
    workday
  end

end
