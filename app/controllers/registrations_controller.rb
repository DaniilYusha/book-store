class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def edit
    set_forms
  end

  def update
    set_forms
    super
  end

  def update_resource(resource, params)
    without_password? ? resource.update_without_password(params) : super(resource, params)
  end

  private

  def set_forms
    @billing_form = AddressForm.new(current_user.billing_address)
    @shipping_form = AddressForm.new(current_user.shipping_address)
  end

  def without_password?
    params[resource_name][:password].blank? && params[resource_name].key?(:email)
  end
end
