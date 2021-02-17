module Sections
  module Admin
    module Orders
      class Actions < SitePrism::Section
        element :in_delivery_button, '.action_item:nth-child(3) > a'
        element :delivered_button, '.action_item:nth-child(4) > a'
        element :canceled_button, '.action_item:last-child > a'
      end
    end
  end
end
