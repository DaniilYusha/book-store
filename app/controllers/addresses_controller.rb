class AddressesController < ApplicationController
  before_action :authenticate_user!

  ATTRIBUTES = %w[first_name last_name address address_type city zip_code country phone].freeze

  def create
    service = SaveAddressService.new(current_user, billing_address_params, shipping_address_params)
    service.call

    if service.success
      redirect_to(edit_user_registration_path, notice: I18n.t('notice.address.saved'))
    else
      render template: 'devise/registrations/edit'
    end
  end

  private

  def billing_address_params
    params.require(:address).permit(billing: ATTRIBUTES.map(&:to_sym))
  end

  def shipping_address_params
    params.require(:address).permit(shipping: ATTRIBUTES.map(&:to_sym))
  end
end
