class AddressForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :address, :city, :zip_code, :country, :phone, :address_type

  BILLING_TYPE = 'billing'.freeze
  SHIPPING_TYPE = 'shipping'.freeze
  NAME_MAX_LENGTH = 50
  NAMES_FORMAT_PATTERN = /\A[a-zA-z\s]+\z/.freeze
  ADDRESS_FORMAT_PATTERN = /\A[a-zA-z0-9,\-\s]+\z/.freeze
  ADDRESS_MAX_LENGTH = 50
  ZIP_MAX_LENGTH = 10
  ZIP_FORMAT_PATTERN = /\A[0-9-]+\z/.freeze
  PHONE_MAX_LENGTH = 15
  PHONE_FORMAT_PATTERN = /\A\+[0-9]+\z/.freeze

  validates :first_name, :last_name, :address, :city, :zip_code, :country, :phone, presence: true
  validates :first_name, :last_name, :country, :city,
            length: { maximum: NAME_MAX_LENGTH }, format: { with: NAMES_FORMAT_PATTERN,
                                                            message: I18n.t('validation.names_format') }
  validates :address, length: { maximum: ADDRESS_MAX_LENGTH },
                      format: { with: ADDRESS_FORMAT_PATTERN,
                                message: I18n.t('validation.address_format') }
  validates :zip_code, length: { maximum: ZIP_MAX_LENGTH },
                       format: { with: ZIP_FORMAT_PATTERN,
                                 message: I18n.t('validation.zip_format') }
  validates :phone, length: { maximum: PHONE_MAX_LENGTH },
                    format: { with: PHONE_FORMAT_PATTERN,
                              message: I18n.t('validation.phone_format') }
  validate :country_presense_in_list, if: -> { country.present? }
  validate :country_code_of_phone, if: -> { phone.present? }

  private

  def country_presense_in_list
    errors.add(:country, :invalid) if ISO3166::Country.find_country_by_name(country).nil?
  end

  def country_code_of_phone
    selected_country = ISO3166::Country.find_country_by_name(country)
    return if country.present? && phone.include?(selected_country.country_code)

    errors.add(:phone, I18n.t('validation.phone_country_code'))
  end
end
