FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    introduction { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to:10) }
    status_id { Faker::Number.between(from: 1, to:6) }
    shipping_cost_id { Faker::Number.between(from: 1, to:2) }
    prefecture_id { Faker::Number.between(from: 1, to:47) }
    delivery_time_id { Faker::Number.between(from: 1, to:3) }
    price { Faker::Commerce.price(range: 300..9999999, as_string: true) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
