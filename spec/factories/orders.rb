FactoryBot.define do
  factory :order do
    number do
      ConfirmCheckoutService::NUMBER_BEGIN +
        Array.new(ConfirmCheckoutService::NUMBER_LENGTH) { rand(ConfirmCheckoutService::NUMBER_RANGE) }.join
    end

    user
  end
end
