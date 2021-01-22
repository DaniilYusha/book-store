FactoryBot.define do
  factory :order_item do
    quantity { 1 }

    association :order
    association :book
  end
end
