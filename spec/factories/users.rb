FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.org" }
    password "123456"

    trait :with_projects do
      after(:create) { |user| create_list(:project, 5, user: user) }
    end
  end
end
