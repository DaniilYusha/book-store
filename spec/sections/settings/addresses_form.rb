module Sections
  module Settings
    class AddressesForm < SitePrism::Section
      element :billing_first_name_input, '#address_billing_first_name'
      element :billing_last_name_input, '#address_billing_last_name'
      element :billing_address_input, '#address_billing_address'
      element :billing_city_input, '#address_billing_city'
      element :billing_zip_input, '#address_billing_zip_code'
      element :billing_country_select, '#address_billing_country'
      element :billing_phone_input, '#address_billing_phone'
      element :save_billing_address_button, '#submit-billing-address'

      element :shipping_first_name_input, '#address_shipping_first_name'
      element :shipping_last_name_input, '#address_shipping_last_name'
      element :shipping_address_input, '#address_shipping_address'
      element :shipping_city_input, '#address_shipping_city'
      element :shipping_zip_input, '#address_shipping_zip_code'
      element :shipping_country_select, '#address_shipping_country'
      element :shipping_phone_input, '#address_shipping_phone'
      element :save_shipping_address_button, '#submit-shipping-address'

      def submit(billing_params, shipping_params)
        fill_in_billing_fields(billing_params)
        fill_in_shipping_fields(shipping_params)
        save_shipping_address_button.click
      end

      def fill_in_billing_fields(params)
        billing_first_name_input.set(params[:first_name])
        billing_last_name_input.set(params[:last_name])
        billing_address_input.set(params[:address])
        billing_city_input.set(params[:city])
        billing_zip_input.set(params[:zip_code])
        billing_country_select.select(params[:country])
        billing_phone_input.set(params[:phone])
      end

      def fill_in_shipping_fields(params)
        shipping_first_name_input.set(params[:first_name])
        shipping_last_name_input.set(params[:last_name])
        shipping_address_input.set(params[:address])
        shipping_city_input.set(params[:city])
        shipping_zip_input.set(params[:zip_code])
        shipping_country_select.select(params[:country])
        shipping_phone_input.set(params[:phone])
      end
    end
  end
end
