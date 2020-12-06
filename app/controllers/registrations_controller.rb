class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def edit
    set_addresses
  end

  def update
    set_addresses
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

  def set_addresses
    @billing_address = current_user.billing_address || Address.new
    @shipping_address = current_user.shipping_address || Address.new
  end
end
