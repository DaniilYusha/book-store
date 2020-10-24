module Sections
  class RemoveAccount < SitePrism::Section
    element :header, 'p.in-gold-500'
    element :remove_confirm_checkbox, '.checkbox > .checkbox-label > .checkbox-icon'
    element :remove_account_button, '.general-settings-btn > input[type="submit"]'
  end
end
