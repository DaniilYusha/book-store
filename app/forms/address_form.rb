class AddressForm
  include ActiveModel::Model
  include Virtus.model

  attribute :first_name, String
  attribute :last_name, String
  attribute :address, String
  attribute :city, String
  attribute :zip_code, String
  attribute :country, String
  attribute :phone, String
  attribute :address_type, String

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
  validate :country_presense_in_list, unless: -> { country.blank? }
  validate :country_code_of_phone, unless: -> { phone.blank? }

  private

  def country_presense_in_list
    errors.add(:country, :invalid) unless ISO3166::Country.find_country_by_name(country)
  end

  def country_code_of_phone
    selected_country = ISO3166::Country.find_country_by_name(country)
    return if country.present? && phone.include?(selected_country.country_code)

    errors.add(:phone, I18n.t('validation.phone_country_code'))
  end
end
