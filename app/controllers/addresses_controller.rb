class AddressesController < ApplicationController
  before_action :authenticate_user!

  ATTRIBUTES = %w[first_name last_name address address_type city zip_code country phone].freeze

  def create
    @form = AddressForm.new(address_form_params)
    redirect_to(edit_user_registration_path, notice: I18n.t('notice.address.saved')) if @form.submit(current_user)
  end

  def update
    @form = AddressForm.new(address_form_params)
    redirect_to(edit_user_registration_path, notice: I18n.t('notice.address.updated')) if @form.submit(current_user)
  end

  private

  def address_form_params
    params.require(:address_form).permit(ATTRIBUTES.map(&:to_sym))
  end
end
