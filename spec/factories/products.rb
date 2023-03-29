FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence(word_count: 4) }
    price { Faker::Commerce.price }
    active { true }
    quantity { Faker::Number.number(digits: 2) }
  end
end
