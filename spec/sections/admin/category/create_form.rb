module Sections
  module Admin
    module Category
      class CreateForm < SitePrism::Section
        element :name_input, '#category_name_input'
        element :create_button, '#category_submit_action > input'
        element :cancel_button, '.cancel'
      end
    end
  end
end
