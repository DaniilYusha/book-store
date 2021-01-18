module Sections
  module Admin
    module BookImage
      class Details < SitePrism::Section
        element :header, '.panel > h3'
        element :book_row, '.row-book'
        element :image_row, '.row-image'
      end
    end
  end
end
