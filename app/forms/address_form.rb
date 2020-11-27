class AddressForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :address, :city, :zip_code, :country, :phone, :address_type

  BILLING_TYPE = 'billing'.freeze
  SHIPPING_TYPE = 'shipping'.freeze
  NAME_MAX_LENGTH = 50
  NAMES_FORMAT_PATTERN = /\A[a-zA-z]+\z/.freeze
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

  def initialize(user, params = {})
    @user = user
    @params = params
    super(@params)
  end

  def validate
    return if valid?

    errors.each do |attribute, message|
      add_errors_to_billing_address(attribute, message) if address_type == BILLING_TYPE
      add_errors_to_shipping_address(attribute, message) if address_type == SHIPPING_TYPE
    end
  end

  private

  attr_reader :user

  def add_errors_to_billing_address(attribute, message)
    return user.billing_address.errors.add(attribute, message) if user.billing_address.present?

    user.build_billing_address.errors.add(attribute, message)
  end

  def add_errors_to_shipping_address(attribute, message)
    return user.shipping_address.errors.add(attribute, message) if user.shipping_address.present?

    user.build_shipping_address.errors.add(attribute, message)
  end

  def country_presense_in_list
    errors.add(:country, :invalid) if ISO3166::Country.find_country_by_name(country).nil?
  end

  def country_code_of_phone
    selected_country = ISO3166::Country.find_country_by_name(country)
    return if country.present? && phone.include?("+#{selected_country.country_code}")

    errors.add(:phone, I18n.t('validation.phone_country_code'))
  end
end
