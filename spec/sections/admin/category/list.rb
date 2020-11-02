module Sections
  module Admin
    module Category
      class List < SitePrism::Section
        element :id_column, '.col-id'
        element :name_column, '.col-name'
      end
    end
  end
end
