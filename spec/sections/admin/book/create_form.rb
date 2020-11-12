module Sections
  module Admin
    module Book
      class CreateForm < SitePrism::Section
        element :category_input, '#book_category_input'
        element :authors_input, '#book_authors_input'
        element :title_input, '#book_title_input'
        element :description_input, '#book_description_input'
        element :price_input, '#book_price_input'
        element :published_at_input, '#book_published_at_input'
        element :height_input, '#book_height_input'
        element :width_input, '#book_width_input'
        element :depth_input, '#book_depth_input'
        element :materials_input, '#book_materials_input'
        element :create_button, '#book_submit_action > input'
        element :cancel_button, '.cancel'
      end
    end
  end
end
