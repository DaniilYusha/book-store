FactoryBot.define do
  factory :material do
    name { FFaker::Lorem.unique.word }
  end
end
