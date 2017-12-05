FactoryGirl.define do
  factory :task do
    content { Faker::Food.ingredient }
    association :project
    completed false
  end
end
