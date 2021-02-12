FactoryBot.define do
  factory :pin do
    association :user
    association :minute
  end
end
