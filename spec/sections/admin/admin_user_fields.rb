module Sections
  module Admin
    class AdminUserFields < SitePrism::Section
      element :email_input, '#admin_user_email_input'
      element :password_input, '#admin_user_password_input'
      element :password_confirmation_input, '#admin_user_password_confirmation_input'
      element :create_button, '#admin_user_submit_action > input'
      element :cancel_button, '.cancel'
    end
  end
end
