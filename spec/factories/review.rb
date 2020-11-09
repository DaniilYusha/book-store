FactoryBot.define do
  factory :review do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    rating { rand(Review::RATING_RANGE) }
    status { :approved }
    is_verified { false }

    association :book
    association :user
  end
end
