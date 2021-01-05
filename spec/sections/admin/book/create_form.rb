module Sections
  module Admin
    module Book
      class CreateForm < SitePrism::Section
        element :category_select, '#book_category_id'
        elements :authors_checkboxes, '.choices-group > li > label > input'
        element :title_input, '#book_title'
        element :description_input, '#book_description'
        element :price_input, '#book_price'
        element :published_at_input, '#book_published_at'
        element :height_input, '#book_height'
        element :width_input, '#book_width'
        element :depth_input, '#book_depth'
        element :materials_input, '#book_materials'
        element :create_button, '#book_submit_action > input'
        element :cancel_button, '.cancel'

        def submit(params)
          category_select.select(params[:category])
          authors_checkboxes.first.set(true)
          fill_in_fields(params.except(:category))
          create_button.click
        end

        private

        def fill_in_fields(params)
          fields = [title_input, description_input, price_input, height_input,
                    width_input, depth_input, materials_input, published_at_input]
          fields.zip(params.values).to_h.each { |field, value| field.set(value) }
        end
      end
    end
  end
end
