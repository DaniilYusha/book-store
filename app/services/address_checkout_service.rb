class AddressCheckoutService
  def initialize(params:, user:, order:)
    @params = params
    @user = user
    @order = order
    @billing_form = AddressForm.new(params[:address][:billing_form])
    @shipping_form = AddressForm.new(params[:address][:shipping_form])
  end

  def call
    return save_with_hidden_shipping if params[:use_billing_address]

    validate_forms
    persist_addresses
  end

  def presenter
    AddressCheckoutPresenter.new(user: user, billing_form: billing_form, shipping_form: shipping_form)
  end

  private

  attr_reader :params, :user, :billing_form, :shipping_form

  def persist_addresses
    return unless forms_valid?

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

  def forms_valid?
    shipping_form.valid? && billing_form.valid?
  end

  def validate_forms
    billing_form.validate
    shipping_form.validate
  end
end
