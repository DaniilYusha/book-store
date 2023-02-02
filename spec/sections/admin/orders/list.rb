module Sections
  module Admin
    module Orders
      class List < SitePrism::Section
        element :id_column, '.col-id'
        element :number_column, '.col-number'
        element :creation_date_column, '.col-creation_date'
        element :status_column, '.col-status'
        element :complete_link, 'li.scope.complete > a'
        element :in_delivery_link, 'li.scope.in_delivery > a'
        element :delivered_link, 'li.scope.delivered > a'
        element :canceled_link, 'li.scope.canceled > a'
      end
    end
  end
end
