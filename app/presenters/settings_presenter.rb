class SettingsPresenter
  BILLING_TYPE = 'billing'.freeze
  SHIPPING_TYPE = 'shipping'.freeze

  def initialize(user, params = {}, address_errors = {})
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

  def shipping_errors
    @shipping_errors ||= address_errors if params[:address_type] == SHIPPING_TYPE
  end

  def billing_errors
    @billing_errors ||= address_errors if params[:address_type] == BILLING_TYPE
  end

  def countries
    @countries ||= ISO3166::Country.all.sort_by(&:name)
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= current_user
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  private

  attr_reader :current_user, :params, :address_errors
end
