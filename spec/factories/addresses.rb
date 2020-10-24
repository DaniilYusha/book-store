FactoryBot.define do
  factory :address do
    first_name { 'Daniil' }
    last_name  { 'Yusha' }
    address { 'Central Park' }
    city { 'Dnipro' }
    zip_code { '6996' }
    country { 'Ukraine' }
    phone { '+3808005553535' }
    address_type { AddressForm::BILLING_TYPE }

    trait :for_user do
      association :addressable, factory: :user
    end
  end
end
