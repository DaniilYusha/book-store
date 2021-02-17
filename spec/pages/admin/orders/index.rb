module Pages
  module Admin
    module Orders
      class Index < SitePrism::Page
        set_url('admin/orders')

        section :main_content, Sections::Admin::Orders::List, '#collection_selection'
      end
    end
  end
end
