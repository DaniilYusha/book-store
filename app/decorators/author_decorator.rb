class AuthorDecorator < ApplicationDecorator
  delegate_all

  def name
    "#{object.first_name} #{object.last_name}"
  end
end
