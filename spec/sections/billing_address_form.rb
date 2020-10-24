module Sections
  class BillingAddressForm < SitePrism::Section
    element :header, 'h3.general-subtitle'
    element :first_name_label, '#billing-form > .address_form_first_name > label'
    element :last_name_label, '#billing-form > .address_form_last_name > label'
    element :address_label, '#billing-form > .address_form_address > label'
    element :city_label, '#billing-form > .address_form_city > label'
    element :zip_label, '#billing-form > .address_form_zip_code > label'
    element :country_label, '#billing-form > .address_form_country > label'
    element :phone_label, '#billing-form > .address_form_phone > label'

    element :first_name_input, '#billing-form > .address_form_first_name > input'
    element :last_name_input, '#billing-form > .address_form_last_name > input'
    element :address_input, '#billing-form > .address_form_address > input'
    element :city_input, '#billing-form > .address_form_city > input'
    element :zip_input, '#billing-form > .address_form_zip_code > input'
    element :country_select, '#billing-form > .address_form_country > select'
    element :phone_input, '#billing-form > .address_form_phone > input'

    element :save_button, '#billing-form > input[type="submit"]'

    def fill_in(address)
      first_name_input.set address.first_name
      last_name_input.set address.last_name
      address_input.set address.address
      city_input.set address.city
      zip_input.set address.zip_code
      country_select.select address.country
      phone_input.set address.phone
      save_button.click
    end
  end
end
