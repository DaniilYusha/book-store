class SaveReviewService
  attr_reader :errors

  def initialize(params)
    @params = params
    @review_form = ReviewForm.new(@params)
  end

  def call
    review_form.valid? ? Review.create(params) : @errors = review_form.errors.full_messages.join(', ')
  end

  private

  attr_reader :params, :review_form
end
