module Sections
  module Admin
    module Author
      class List < SitePrism::Section
        element :id_column, '.col-id'
        element :first_name_column, '.col-first_name'
        element :last_name_column, '.col-last_name'
      end
    end
  end
end
