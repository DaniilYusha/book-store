class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    service = PersistReviewService.new(review_params)
    service.call ? flash[:notice] = I18n.t('notice.review.created') : flash[:alert] = service.errors

    redirect_back fallback_location: books_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :text, :rating, :book_id, :user_id)
  end
end
