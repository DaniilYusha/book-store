module Pages
  module Admin
    class Reviews < SitePrism::Page
      set_url 'admin/reviews'

      section :main_content, Sections::Admin::Review::List, '#collection_selection'
    end
  end
end
