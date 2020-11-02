module Sections
  module Admin
    class AdminDetails < SitePrism::Section
      element :header, '.panel > h3'
      element :email_row, '.row-email'
      element :reset_password_token_list_row, '.row-reset_password_token'
      element :reset_password_sent_at_row, '.row-reset_password_sent_at'
      element :remember_created_at_row, '.row-remember_created_at'
      element :created_at_row, '.row-created_at'
      element :updated_at_row, '.row-updated_at'
    end
  end
end
