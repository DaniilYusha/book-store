class SaveAddressService
  attr_reader :success

  def initialize(user:, params:, id: nil)
    @user = user
    @params = params
    @id = id
    @form = AddressForm.new(@params.except(:addressable))
  end

  def call
    address = Address.find_by(id: id) || Address.new(addressable: user)

    form_is_valid? ? address.update(params) : add_errors_to_addres(handle_address_status)
  end

  private

  attr_reader :id, :user, :params, :form

  def handle_address_status
    case params[:address_type]
    when AddressForm::BILLING_TYPE then check_billing_address_presence
    when AddressForm::SHIPPING_TYPE then check_shipping_address_presence
    end
  end

  def check_billing_address_presence
    user.billing_address.present? ? user.billing_address : user.build_billing_address(params)
  end

  def check_shipping_address_presence
    user.shipping_address.present? ? user.shipping_address : user.build_shipping_address(params)
  end

  def add_errors_to_addres(address)
    form.errors.each do |attribute, message|
      address.errors.add(attribute, message)
    end
  end

  def form_is_valid?
    @success = form.valid?
  end
end
