class AddressesController < ApplicationController
  before_action :authenticate_user!

  def create
    service = PersistAddressService.new(user: current_user, params: address_params)
    if service.call
      redirect_to(settings_path, notice: I18n.t('notice.address.saved'))
    else
      @presenter = SettingsPresenter.new(current_user, address_params, service.errors)
      render 'settings/index'
    end
  end

  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :address, :address_type,
                                    :city, :zip_code, :country, :phone)
  end
end
