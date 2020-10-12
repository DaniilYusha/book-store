module Sections
  class SignUpForm < SitePrism::Section
    element :email_label, 'label[for="user_email"]'
    element :email_field, '#email'
    element :password_label, 'label[for="user_password"]'
    element :password_field, '#password'
    # element :forgot_password_link, 'a.help-block'
    # element :remember_me_checkbox, '.checkbox-label'
    element :confirm_password_label, 'label[for="user_password_confirmation"]'
    element :confirm_password_field, '#confirm'
    element :sign_up_button, 'input[type="submit"]'

    def registrate_user(email, password, password_confirmation)
      email_field.set email
      password_field.set password
      confirm_password_field.set password_confirmation
      sign_up_button.click
    end
  end
end
