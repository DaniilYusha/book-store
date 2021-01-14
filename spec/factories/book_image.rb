FactoryBot.define do
  factory :book_image do
    image { File.open('spec/fixtures/images/default.jpg') }
  end
end
