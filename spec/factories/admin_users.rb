FactoryBot.define do
  factory :admin_user do
    email { "ex#{FFaker::Internet.free_email}" }
    password { 'RG2020RoR' }
  end
end
