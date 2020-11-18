class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def create
    without_password? ? create_user_without_password : super
  end

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
    @billing_form = AddressForm.new current_user.billing_address
    @shipping_form = AddressForm.new current_user.shipping_address
  end

  def without_password?
    params[resource_name][:password].blank? && params[resource_name].key?(:email)
  end

  def create_user_without_password
    user = User.create(email: params[resource_name][:email], confirmed_at: Time.now.utc)
    user.send_reset_password_instructions
    redirect_back fallback_location: root_path, notice: I18n.t('devise.passwords.send_instructions')
  end
end
