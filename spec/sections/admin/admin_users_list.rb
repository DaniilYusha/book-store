module Sections
  module Admin
    class AdminUsersList < SitePrism::Section
      element :id_column, '.col-id'
      element :name_column, '.col-email'
    end
  end
end
