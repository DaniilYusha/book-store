class SettingsPresenter
  def initialize(user:, params: {}, address_errors: {})
    @current_user = user
    @params = params
    @address_errors = address_errors
  end

  def billing_address
    current_user.billing_address || Address.new(params)
  end

  def shipping_address
    current_user.shipping_address || Address.new(params)
  end

  def billing_errors
    @billing_errors ||= check_address_type_errors(:billing)
  end

  def shipping_errors
    @shipping_errors ||= check_address_type_errors(:shipping)
  end

  def countries
    @countries ||= ISO3166::Country.all.sort_by(&:name)
  end

  private

  attr_reader :current_user, :params, :address_errors

  def check_address_type_errors(address_type)
    address_errors if params[:address_type] == address_type.to_s
  end
end
