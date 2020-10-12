module Sections
  class ForgotPasswordForm < SitePrism::Section
    element :email_label, 'label[for="user_email"]'
    element :email_field, '#email'
    element :send_instructions_button, 'input[type="submit"]'
    element :cancel_button, 'button[type="button"]'

    def send_forgot_password_instructions(email)
      email_field.set email
      send_instructions_button.click
    end
  end
end