class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review_form = ReviewForm.new(review_params)
    return redirect_to books_path, notice: I18n.t('notice.review.created') if @review_form.submit

    @book_id = review_params[:book_id]
  end

  private

  def review_params
    params.require(:review_form).permit(:title, :text, :rating, :book_id, :user_id)
  end
end
