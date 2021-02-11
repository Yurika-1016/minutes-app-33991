FactoryBot.define do
  factory :to_do_list do
    list1 { Faker::Lorem.sentence }
    list2 { Faker::Lorem.sentence }
    list3 { Faker::Lorem.sentence }
    list4 { Faker::Lorem.sentence }
    list5 { Faker::Lorem.sentence }
    list6 { Faker::Lorem.sentence }
    list7 { Faker::Lorem.sentence }
    list8 { Faker::Lorem.sentence }
    list9 { Faker::Lorem.sentence }
    list10 { Faker::Lorem.sentence }
    checked_list1 { Faker::Boolean.boolean(true_ratio: 0.5) }
    checked_list2 { Faker::Boolean.boolean(true_ratio: 0.5) }
    checked_list3 { Faker::Boolean.boolean(true_ratio: 0.5) }
    checked_list4 { Faker::Boolean.boolean(true_ratio: 0.5) }
    checked_list5 { Faker::Boolean.boolean(true_ratio: 0.5) }
    checked_list6 { Faker::Boolean.boolean(true_ratio: 0.5) }
    checked_list7 { Faker::Boolean.boolean(true_ratio: 0.5) }
    checked_list8 { Faker::Boolean.boolean(true_ratio: 0.5) }
    checked_list9 { Faker::Boolean.boolean(true_ratio: 0.5) }
    checked_list10 { Faker::Boolean.boolean(true_ratio: 0.5) }
    association :user
    association :minute
  end
end
