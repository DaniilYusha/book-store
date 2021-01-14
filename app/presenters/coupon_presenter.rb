class CouponPresenter
  attr_reader :errors

  def initialize(errors:)
    @errors = errors.full_messages.to_sentence
  end
end
