module Sections
  module Settings
    class AddressForm < SitePrism::Section
      element :first_name_input, '#address_first_name'
      element :last_name_input, '#address_last_name'
      element :address_input, '#address_address'
      element :city_input, '#address_city'
      element :zip_input, '#address_zip_code'
      element :country_select, '#address_country'
      element :phone_input, '#address_phone'
      element :save_address_button, 'input[type="submit"]'

      def submit(params)
        first_name_input.set(params[:first_name])
        last_name_input.set(params[:last_name])
        address_input.set(params[:address])
        city_input.set(params[:city])
        zip_input.set(params[:zip_code])
        country_select.select(params[:country])
        phone_input.set(params[:phone])
        save_address_button.click
      end
    end
  end
end
