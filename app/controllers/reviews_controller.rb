class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    service = CreateReviewService.new(review_params)
    if service.call
      flash[:notice] = I18n.t('notice.review.created')
    else
      presenter = ReviewPresenter.new(errors: service.errors)
      flash[:alert] = presenter.errors
    end

    redirect_back fallback_location: books_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :text, :rating, :book_id, :user_id)
  end
end
