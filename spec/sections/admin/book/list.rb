module Sections
  module Admin
    module Book
      class List < SitePrism::Section
        element :id_column, '.col-id'
        element :category_column, '.col-category'
        element :title_column, '.col-title'
        element :description_column, '.col-short_description'
        element :authors_column, '.col-authors_list'
        element :price_column, '.col-price'
      end
    end
  end
end
