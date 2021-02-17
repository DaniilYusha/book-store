FactoryBot.define do
  factory :credit_card do
    name { FFaker::Bank.card_type }
    number { Array.new(CreditCardForm::CARD_NUMBER_LENGTH) { rand(0..9) }.join }
    date { FFaker::Bank.card_expiry_date }
    cvv { rand(100..9999) }
  end
end
