module Sections
  module Admin
    module BookImage
      class List < SitePrism::Section
        element :id_column, '.col-id'
        element :book_column, '.col-book'
        element :image_column, '.col-image'
      end
    end
  end
end
