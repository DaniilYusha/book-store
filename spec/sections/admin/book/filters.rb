module Sections
  module Admin
    module Book
      class Filters < SitePrism::Section
        element :header, 'h3'
        elements :filter_fields, '.filter_form > .filter_form_field'
        element :filter_button, '.filter_form > .buttons > input'
        element :clear_filters_button, '.filter_form > .buttons > .clear_filters_btn'
      end
    end
  end
end
