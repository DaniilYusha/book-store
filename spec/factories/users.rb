FactoryBot.define do
  factory :user do
    email { "ex#{FFaker::Internet.free_email}" }
    password { 'RG2020RoR' }
    provider { I18n.t(:provider).downcase }
    uid { 9.times.map { rand(1..9) }.join }
    confirmation_token { Devise.token_generator.generate(User, :confirmation_token)[1] }
    confirmed_at { Time.now.utc }
  end
end
