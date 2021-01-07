module Sections
  module Admin
    module Category
      class CreateForm < SitePrism::Section
        element :name_input, '#category_name'
        element :create_button, '#category_submit_action > input'
        element :cancel_button, '.cancel'

        def submit(params)
          name_input.set(params[:name])
          create_button.click
        end
      end
    end
  end
end
