FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    price { rand(1.0..1000.0).floor(2) }
    height { rand(7.0..40.0).floor(2) }
    width { rand(1.0..20.0).floor(2) }
    depth { rand(1.0..7.0).floor(2) }
    materials { FFaker::Lorem.word }
    published_at { FFaker::Time.date }
    association :category
  end
end
