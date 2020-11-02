module Sections
  module Admin
    module Book
      class List < SitePrism::Section
        element :id_column, '.col-id'
        element :category_column, '.col-category'
        element :title_column, '.col-title'
        element :materials_column, '.col-materials'
        element :description_column, '.col-description'
        element :authors_column, '.col-authors'
        element :price_column, '.col-price'
        element :published_at_column, '.col-published_at'
      end
    end
  end
end
