module Sections
  module Admin
    module Book
      class Details < SitePrism::Section
        element :header, '.panel > h3'
        element :category_row, '.row-category'
        element :authors_list_row, '.row-authors_list'
        element :title_row, '.row-title'
        element :description_row, '.row-description'
        element :price_row, '.row-price'
        element :published_at_row, '.row-published_at'
        element :height_row, '.row-height'
        element :width_row, '.row-width'
        element :depth_row, '.row-depth'
        element :materials_row, '.row-materials_list'
      end
    end
  end
end
