class BookImageDecorator < ApplicationDecorator
  include ActionView::Helpers::AssetTagHelper
  delegate_all

  def image(size = :w170)
    image_tag(object.image_url(size))
  end
end
