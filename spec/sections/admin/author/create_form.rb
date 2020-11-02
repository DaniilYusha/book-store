module Sections
  module Admin
    module Author
      class CreateForm < SitePrism::Section
        element :first_name_input, '#author_first_name_input'
        element :last_name_input, '#author_last_name_input'
        element :create_button, '#author_submit_action > input'
        element :cancel_button, '.cancel'
      end
    end
  end
end
