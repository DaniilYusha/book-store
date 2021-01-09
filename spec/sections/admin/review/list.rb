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
        element :unprocessed_link, 'li.scope.unprocessed > a'
        element :approved_link, 'li.scope.approved > a'
        element :rejected_link, 'li.scope.rejected > a'
      end
    end
  end
end
