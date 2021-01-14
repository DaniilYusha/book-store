class CreateReviewService
  attr_reader :errors

  def initialize(params)
    @review_form = ReviewForm.new(params)
  end

  def call
    review_form.valid? ? Review.create(review_form.attributes) : @errors = review_form.errors

    errors.blank?
  end

  private

  attr_reader :review_form
end
