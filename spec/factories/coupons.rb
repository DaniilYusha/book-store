FactoryBot.define do
  factory :coupon do
    code { FFaker::NatoAlphabet.code }
    discount { rand(0.1..100.0).floor(2) }
    is_valid { true }
  end
end
