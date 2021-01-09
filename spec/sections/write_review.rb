module Sections
  class WriteReview < SitePrism::Section
    element :form_header, 'h3'
    elements :stars, '#stars > .rate-star'
    element :title_field, '#review_title'
    element :text_field, '#review_text'
    element :post_button, '.text-right > input[type="submit"]'

    def submit(params)
      stars[params[:rating].pred].click
      title_field.set(params[:title])
      text_field.set(params[:text])
      post_button.click
    end
  end
end
