class AddressCheckoutService
  def initialize(params:, user:)
    @params = params
    @user = user
    @billing_form = AddressForm.new(params[:address][:billing_form])
    @shipping_form = AddressForm.new(params[:address][:shipping_form])
  end

  def call
    params[:use_billing_address] ? save_with_hidden_shipping : persist_addresses

    shipping_form.valid? && billing_form.valid?
  end

  def presenter
    AddressCheckoutPresenter.new(user: user, billing_form: billing_form, shipping_form: shipping_form)
  end

  private

  attr_reader :params, :user, :billing_form, :shipping_form

  def persist_addresses
    return if shipping_form.invalid? && billing_form.invalid?

    save_address(billing_form.attributes.merge(addressable: user))
    save_address(shipping_form.attributes.merge(addressable: user))
  end

  def save_with_hidden_shipping
    return if billing_form.invalid?

    save_address(billing_form.attributes.merge(addressable: user))
    billing_form.address_type = :shipping
    save_address(billing_form.attributes.merge(addressable: user))
  end

  def save_address(attributes)
    address = Address.find_by(addressable_id: user.id, address_type: attributes[:address_type])
    address ? address.update(attributes) : Address.create(attributes)
  end
end
