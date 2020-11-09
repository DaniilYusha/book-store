module Sections
  module Admin
    module Review
      class List < SitePrism::Section
        element :id_column, '.col-id'
        element :book_column, '.col-book'
        element :title_column, '.col-title'
        element :created_at_column, '.col-created_at'
        element :user_column, '.col-user'
        element :status_column, '.col-status'
      end
    end
  end
end
