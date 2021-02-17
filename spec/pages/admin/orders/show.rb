module Pages
  module Admin
    module Orders
      class Show < SitePrism::Page
        set_url('admin/orders/{id}')

        section :order_details, Sections::Admin::Orders::Details, '#main_content'
        section :actions, Sections::Admin::Orders::Actions, '#titlebar_right'
      end
    end
  end
end
