class AddressCheckoutPresenter < AddressBasePresenter
  def initialize(user:, params: {}, billing_form: nil, shipping_form: nil)
    super(user: user, params: params)

    @billing_form = billing_form
    @shipping_form = shipping_form
  end

  def billing_errors
    @billing_errors ||= billing_form&.errors
  end

  def shipping_errors
    @shipping_errors ||= shipping_form&.errors
  end

  private

  attr_reader :billing_form, :shipping_form
end
