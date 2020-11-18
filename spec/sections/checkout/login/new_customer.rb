module Sections
  module Checkout
    module Login
      class NewCustomer < SitePrism::Section
        element :form_header, 'h3.general-subtitle'
        element :email_label, 'label.email'
        element :email_field, '#user_email'
        element :continue_to_checkout_button, 'input[type="submit"]'

        def fill_in_form(email)
          email_field.set(email)
          continue_to_checkout_button.click
        end
      end
    end
  end
end
