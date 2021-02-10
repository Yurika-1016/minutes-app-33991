FactoryBot.define do
  factory :comment do
    title { Faker::Lorem.sentence }
    association :user
    association :minute
  end
end
