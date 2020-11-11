FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    provider { I18n.t(:provider).downcase }
    uid { 9.times.map { rand(1..9) }.join }
    confirmation_token { Devise.token_generator.generate(User, :confirmation_token)[1] }
    confirmed_at { Time.now.utc }
  end
end
