FactoryBot.define do
  factory :minute do
    title { Faker::Lorem.sentence }
    project_name { Faker::Lorem.sentence }
    participate_member { Faker::Lorem.sentence }
    meeting_date { Faker::Number.number(digits: 7).to_s.insert(4, '/').to_s.insert(6, '/') }
    all_complete_date { Faker::Number.number(digits: 7).to_s.insert(4, '/').to_s.insert(6, '/') }
    content { Faker::Lorem.sentence }
    association :user
  end
end
