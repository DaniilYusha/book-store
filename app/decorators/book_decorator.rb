class BookDecorator < ApplicationDecorator
  delegate_all

  def authors
    object.authors.map(&:name).join ', '
  end
end
