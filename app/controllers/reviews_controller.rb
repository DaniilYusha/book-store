class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    service = SaveReviewService.new(review_params)
    service.call

    service.errors.blank? ? flash[:notice] = I18n.t('notice.review.created') : flash[:alert] = service.errors
    redirect_back fallback_location: books_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :text, :rating, :book_id, :user_id)
  end
end
