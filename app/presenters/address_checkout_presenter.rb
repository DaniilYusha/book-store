class AddressCheckoutPresenter
  def initialize(user:, params: {}, billing_form: nil, shipping_form: nil)
    @user = user
    @params = params[:address]
    @billing_form = billing_form
    @shipping_form = shipping_form
  end

  def billing_address
    user.billing_address || Address.new()
  end

  def shipping_address
    user.shipping_address || Address.new()
  end

  def billing_errors
    @billing_errors ||= billing_form&.errors
  end

  def shipping_errors
    @shipping_errors ||= shipping_form&.errors
  end

  def countries
    @countries ||= ISO3166::Country.all.sort_by(&:name)
  end

  private

  attr_reader :user, :params, :billing_form, :shipping_form
end
