module Sections
  module Admin
    module Orders
      class Details < SitePrism::Section
        element :number_row, '.row-number'
        element :creation_date_row, '.row-creation_date'
        element :status_row, '.row-status'
      end
    end
  end
end
