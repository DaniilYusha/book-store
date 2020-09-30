FactoryBot.define do
  factory :book do
    title { Faker::Book.unique.title }
    description { Faker::Books::Dune.quote }
    price { Faker::Commerce.price(range: 0..1000.0) }
    height { Faker::Number.decimal(l_digits: 2) }
    width { Faker::Number.decimal(l_digits: 2) }
    depth { Faker::Number.decimal(l_digits: 2) }
    published_at { Faker::Date.between(from: '1990-01-01', to: '2020-09-15') }
    association :category

    factory :book_with_associations do
      transient do
        authors_count { 3 }
        materials_count { 2 }
      end

      after(:create) do |book, evaluator|
        create_list(:author, evaluator.authors_count, books: [book])
        create_list(:material, evaluator.materials_count, books: [book])
        book.reload
      end
    end
  end
end
