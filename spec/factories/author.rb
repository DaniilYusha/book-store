FactoryBot.define do
  factory :author do
    first_name { Faker::Book.author.split.first }
    last_name  { Faker::Book.author.split.last }
  end
end
