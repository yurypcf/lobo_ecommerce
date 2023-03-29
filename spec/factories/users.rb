FactoryBot.define do
  factory :user do
    password = Faker::Number.number(digits: 6)
    document_number = CPF.generate(true)

    email { Faker::Internet.email }
    name { Faker::Name.name }
    document_number { document_number }
    password { password }
    password_confirmation { password }
  end
end
