class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def update
    resource_is_updated = update_resource(resource, account_update_params)

    resource_is_updated ? send_successful_response : send_fail_response
  end

  private

  def send_successful_response
    prev_unconfirmed_email = resource.unconfirmed_email

    set_flash_message_for_update(resource, prev_unconfirmed_email)
    bypass_sign_in(resource, scope: resource_name) if sign_in_after_change_password?
    respond_with(resource, location: after_update_path_for(resource))
  end

  def send_fail_response
    flash.alert = I18n.t('alert.privacy')
    @presenter = SettingsPresenter.new(resource)
    render 'settings/index'
  end

  def update_resource(resource, params)
    return super unless params.key?(:email)

    resource.update_without_password(params)
  end

  def after_update_path_for(_resource)
    settings_path
  end
end
