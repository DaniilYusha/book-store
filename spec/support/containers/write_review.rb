module Sections
  class WriteReview < SitePrism::Section
    element :write_review_text, 'h3'
    element :scores, 'div.mb-15'
    element :title_field, '#title'
    element :review_field, '#review'
  end
end
