module Sections
  module Admin
    class AdminUserFields < SitePrism::Section
      element :email_row, '#admin_user_email_input'
      element :email_input, '#admin_user_email'
      element :password_row, '#admin_user_password_input'
      element :password_input, '#admin_user_password'
      element :password_confirmation_row, '#admin_user_password_confirmation_input'
      element :password_confirmation_input, '#admin_user_password_confirmation'
      element :create_button, '#admin_user_submit_action > input'
      element :cancel_button, '.cancel'

      def submit(email, password)
        email_input.set(email)
        password_input.set(password)
        password_confirmation_input.set(password)
        create_button.click
      end
    end
  end
end
