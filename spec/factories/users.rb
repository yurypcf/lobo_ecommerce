FactoryBot.define do
  factory :user do
    password = Faker::Number.number(digits: 6)

    email { Faker::Internet.email }
    name { Faker::Name.name }
    document_number { Faker::Number.number(digits: 11) }
    password { password }
    password_confirmation { password }
  end
end
