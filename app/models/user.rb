class User < ApplicationRecord
  PASSWORD_FORMAT = /\A(?!.*\s)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/x.freeze

  has_many :reviews, dependent: :destroy
  has_one :cart
  has_one :billing_address, -> { where(address_type: 0) }, class_name: 'Address',
                                                           as: :addressable,
                                                           dependent: :destroy
  has_one :shipping_address, -> { where(address_type: 1) }, class_name: 'Address',
                                                            as: :addressable,
                                                            dependent: :destroy

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  validates :password, format: { with: PASSWORD_FORMAT }, if: :password_required?

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end
end
