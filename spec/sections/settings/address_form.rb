module Sections
  module Settings
    class AddressForm < SitePrism::Section
      element :first_name_input, '#address_first_name'
      element :last_name_input, '#address_last_name'
      element :address_input, '#address_address'
      element :city_input, '#address_city'
      element :zip_code_input, '#address_zip_code'
      element :country_select, '#address_country'
      element :phone_input, '#address_phone'
      element :save_address_button, 'input[type="submit"]'

      def submit(params)
        fill_in_fields(params.except(:country))
        country_select.select(params[:country])
        save_address_button.click
      end

      private

      def fill_in_fields(params)
        fields = [first_name_input, last_name_input, address_input, city_input, zip_code_input, phone_input]
        fields.zip(params.values).to_h.each { |field, value| field.set(value) }
      end
    end
  end
end
