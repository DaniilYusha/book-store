FactoryBot.define do
  factory :review do
    title { FFaker::Book.title }
    text { FFaker::Book.description }
    rating { rand(Review::RATING_RANGE) }
    status { :approved }
    is_verified { false }

    association :book
    association :user
  end
end
