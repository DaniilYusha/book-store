FactoryBot.define do
  factory :category do
    name { FFaker::Lorem.unique.word }

    factory :category_with_books do
      transient do
        books_count { 3 }
      end

      after(:create) do |category, evaluator|
        create_list(:book, evaluator.books_count, category: category)
        category.reload
      end
    end
  end
end
