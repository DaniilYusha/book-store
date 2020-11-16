FactoryBot.define do
  factory :cart_item do
    quantity { 1 }

    association :cart
    association :book
  end
end
