class ReviewDecorator < ApplicationDecorator
  delegate_all

  def creation_date
    object.created_at.strftime('%d/%m/%y')
  end
end
