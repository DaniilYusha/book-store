FactoryBot.define do
  factory :user do
    email { Faker::Internet.email(name: Faker::Internet.username, domain: 'gmail') }
    password { 'Password2020' }
    provider { 'facebook' }
    uid { Faker::Omniauth.facebook[:uid] }
    confirmation_token { Devise.token_generator.generate(User, :confirmation_token)[1] }
    confirmed_at { Time.now.utc }
  end
end
