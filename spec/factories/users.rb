FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end

    last_name {person.last.kanji}
    first_name {person.first.kanji}
    email {Faker::Internet.email}
    password {Faker::Lorem.characters(number: 6)}
    password_confirmation {password}
    employee_number {Faker::Number.number(digits: 5)}
  end
end
