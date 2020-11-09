module Sections
  class EmailForm < SitePrism::Section
    element :header, 'p.in-gold-500'
    element :email_label, '#edit-email > .email > label'
    element :email_input, '#edit-email > .email > input'
    element :save_button, '#edit-email > .general-text-align > input[type="submit"]'
  end
end