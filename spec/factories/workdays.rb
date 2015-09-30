# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workday do
    day '2013-04-04'
  end

  factory :other_workday, class: Workday do
    day '2013-04-05'
  end
end
