FactoryBot.define do
  factory :item do
    name                    { Faker::Name.name }
    info                    { Faker::Lorem.sentence }
    genre_id                { 2 }
    status_id               { 2 }
    shipping_fee_status_id  { 2 }
    prefecture_id           { 2 }
    scheduled_delivery_id   { 2 }
    price                   { 50_000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
