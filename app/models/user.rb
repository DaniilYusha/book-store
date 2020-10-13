class User < ApplicationRecord
  PASSWORD_FORMAT = /\A(?!.*\s)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/x.freeze

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  validates :password, format: { with: PASSWORD_FORMAT }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
<<<<<<< HEAD
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
=======
      user.password = Devise.friendly_token[0,20]
>>>>>>> 4f173f4... Add some changes to facebook login logic
    end
  end
end
