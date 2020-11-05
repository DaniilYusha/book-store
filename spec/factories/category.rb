FactoryBot.define do
  factory :category do
    name { FFaker::Lorem.unique.word }
  end
end
