class SaveAddressService
  attr_reader :success

  def initialize(user, billing_params, shipping_params)
    @user = user
    @billing_params = billing_params[:billing]
    @shipping_params = shipping_params[:shipping]
    @billing_form = AddressForm.new(@user, @billing_params)
    @shipping_form = AddressForm.new(@user, @shipping_params)
  end

  def call
    billing_form.validate
    shipping_form.validate
    addresses_exist? ? update_addresses : create_addresses
  end

  private

  attr_reader :user, :billing_params, :shipping_params, :billing_form, :shipping_form

  def addresses_exist?
    user.billing_address.present? && user.shipping_address.present?
  end

  def update_addresses
    return unless forms_are_valid?

    user.billing_address.update(billing_params)
    user.shipping_address.update(shipping_params)
  end

  def create_addresses
    return unless forms_are_valid?

    user.addresses.create(billing_params)
    user.addresses.create(shipping_params)
  end

  def forms_are_valid?
    @success = billing_form.errors.empty? && shipping_form.errors.empty?
  end
end
