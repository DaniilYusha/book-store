module Sections
  class SignInForm < SitePrism::Section
    element :email_label, 'label[for="user_email"]'
    element :email_field, '#user_email'
    element :password_label, 'label[for="user_password"]'
    element :password_field, '#user_password'
    element :forgot_password_link, 'a.help-block'
    element :remember_me_checkbox, '.checkbox-label'
    element :sign_in_button, 'input[type="submit"]'

    def authenticate_user(email, password)
      email_field.set email
      password_field.set password
      sign_in_button.click
    end
  end
end
