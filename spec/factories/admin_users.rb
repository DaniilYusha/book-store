FactoryBot.define do
  factory :admin_user do
    email { Faker::Internet.email(name: Faker::Internet.username, domain: 'gmail') }
    password { 'Password2020' }
  end
end
