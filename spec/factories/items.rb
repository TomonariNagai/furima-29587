FactoryBot.define do
  factory :item do
    name              {Faker::Name.initials}
    text              {Faker::Lorem.sentences}
    category_id       {2}
    condition_id      {3}
    shipping_fee_id   {2}
    shipping_from_id  {10}
    shipping_date_id  {3}
    price             {1000}
    association       :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'camera.png')
    end
  end
end
