FactoryBot.define do
  factory :review do
    title { FFaker::Book.title }
    text { FFaker::Book.description }
    rating { rand(ReviewForm::RATING_RANGE) }
    status { :approved }
    is_verified { false }
    created_at { FFaker::Time.date }

    book
    user
  end
end
