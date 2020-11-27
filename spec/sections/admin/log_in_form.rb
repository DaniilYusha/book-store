module Sections
  module Admin
    class LogInForm < SitePrism::Section
      element :form_header, 'h2'
      element :email_label, '#admin_user_email_input > label'
      element :email_field, '#admin_user_email'
      element :password_label, '#admin_user_password_input > label'
      element :password_field, '#admin_user_password'
      element :log_in_button, '#admin_user_submit_action > input'

      def fill_in(email, password)
        email_field.set(email)
        password_field.set(password)
        log_in_button.click
      end
    end
  end
end
