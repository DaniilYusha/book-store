FactoryBot.define do
  factory :address do
    first_name { FFaker::Name.first_name }
    last_name  { FFaker::Name.last_name }
    address { FFaker::Address.street_name }
    city { FFaker::Address.city }
    zip_code { rand(1000..9999).to_s }
    country { 'Ukraine' }
    phone { '+3808005553535' }
    address_type { 'billing' }

    trait :for_user do
      association :addressable, factory: :user
    end
  end
end
