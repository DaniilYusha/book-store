module Sections
  class WriteReview < SitePrism::Section
    element :write_review_text, 'h3'
    element :scores, 'div.mb-15'
    element :title_field, '#review_title'
    element :review_field, '#review_text'
  end
end
