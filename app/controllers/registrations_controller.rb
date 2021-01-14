class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def create
    without_password? ? create_user_without_password : super
  end

  def update
    update_resource(resource, account_update_params) ? send_successful_response : send_fail_response
  end

  private

  def send_successful_response
    set_flash_message_for_update(resource, resource.unconfirmed_email)
    bypass_sign_in(resource, scope: resource_name) if sign_in_after_change_password?
    respond_with(resource, location: settings_path)
  end

  def send_fail_response
    flash.alert = I18n.t('alert.privacy')
    @presenter = SettingsPresenter.new(user: resource)
    render 'settings/index'
  end

  def update_resource(resource, params)
    return super unless params.key?(:email)

    resource.update_without_password(params)
  end

  def create_user_without_password
    user = User.create(email: params[resource_name][:email], confirmed_at: Time.now.utc)
    user.send_reset_password_instructions
    redirect_back fallback_location: root_path, notice: I18n.t('devise.passwords.send_instructions')
  end
end
