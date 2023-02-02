class SettingsPresenter < AddressBasePresenter
  def initialize(user:, params: {}, address_errors: {})
    super(user: user, params: params)

    @address_errors = address_errors
  end

  def billing_address
    user.billing_address || new_address(:billing)
  end

  def shipping_address
    user.shipping_address || new_address(:shipping)
  end

  def billing_errors
    @billing_errors ||= check_address_type_errors(:billing)
  end

  def shipping_errors
    @shipping_errors ||= check_address_type_errors(:shipping)
  end

  private

  attr_reader :address_errors

  def check_address_type_errors(address_type)
    address_errors if params[:address_type] == address_type.to_s
  end

  def new_address(address_type)
    params[:address_type] == address_type.to_s ? Address.new(params) : Address.new
  end
end
