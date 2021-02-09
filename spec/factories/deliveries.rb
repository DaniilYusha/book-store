FactoryBot.define do
  factory :delivery do
    method { FFaker::BaconIpsum.word }
    price { rand(1.0..1000.0).floor(2) }
    from_days { rand(1..10) }
    to_days { rand(11..20) }
  end
end
