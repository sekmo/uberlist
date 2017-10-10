FactoryGirl.define do
  factory :project do
    name Faker::Book.title
    association :user

    trait :invalid do
      name nil
    end

    trait :with_tasks do
      after(:create) { |project| create_list(:task, 5, project: project) }
    end
  end
end
