class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def edit
    set_forms
  end

  def update
    set_forms
    super
  end

  protected

  def update_resource(resource, params)
    return super unless params.key?(:email)

    resource.update_without_password(params)
  end

  def after_update_path_for(_resource)
    edit_user_registration_path
  end

  private

  def set_forms
    @billing_form = AddressForm.new(current_user.billing_address)
    @shipping_form = AddressForm.new(current_user.shipping_address)
  end
end
