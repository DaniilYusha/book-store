module Sections
  module Admin
    module BookImage
      class CreateForm < SitePrism::Section
        element :book_select, '#book_image_book_id'
        element :image_input, '#book_image_image_input'
        element :create_button, '#book_image_submit_action > input'
        element :cancel_button, '.cancel'

        def submit(params)
          book_select.select(params[:book])
          image_input.set('spec/fixtures/images/default.jpg')
          create_button.click
        end
      end
    end
  end
end
