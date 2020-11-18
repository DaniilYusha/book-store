module Sections
  module Checkout
    module Login
      class ReturningCustomer < SitePrism::Section
        element :form_header, 'h3.general-subtitle'
        element :email_label, 'label.email'
        element :email_field, '#user_email'
        element :password_label, 'label.password'
        element :password_field, '#user_password'
        element :forgot_password_link, 'a.help-block'
        element :login_with_password_button, 'input[type="submit"]'

        def fill_in_form(user)
          email_field.set(user.email)
          password_field.set(user.password)
          login_with_password_button.click
        end
      end
    end
  end
end
