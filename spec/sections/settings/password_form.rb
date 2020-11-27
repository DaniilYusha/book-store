module Sections
  module Settings
    class PasswordForm < SitePrism::Section
      element :header, 'p.in-gold-500'
      element :old_password_label, '#edit-password > .user_current_password > label'
      element :new_password_label, '#edit-password > .user_password > label'
      element :password_confirm_label, '#edit-password > .user_password_confirmation > label'

      element :old_password_input, '#edit-password > .user_current_password > input'
      element :new_password_input, '#edit-password > .user_password > input'
      element :password_confirm_input, '#edit-password > .user_password_confirmation > input'

      element :save_button, '.general-text-align > input[type="submit"]'

      def fill_in(current_password, new_password)
        old_password_input.set current_password
        new_password_input.set new_password
        password_confirm_input.set new_password
        save_button.click
      end
    end
  end
end
