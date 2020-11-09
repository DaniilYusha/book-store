module Sections
  module Admin
    module Review
      class Details < SitePrism::Section
        element :header, '.panel > h3'
        element :title_row, '.row-title'
        element :text_row, '.row-text'
        element :rating_row, '.row-rating'
        element :status_row, '.row-status'
        element :is_verified_row, '.row-is_verified'
        element :user_row, '.row-user'
        element :book_row, '.row-book'
      end
    end
  end
end
