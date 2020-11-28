ActiveAdmin.register Review do
  permit_params :title, :text, :rating, :status, :is_verified, :user_id, :book_id
  includes :book, :user
  decorate_with ReviewDecorator

  actions :index, :show

  filter :book
  filter :title
  filter :created_at
  filter :user
  filter :status

  index do
    selectable_column
    id_column
    column :book
    column :title
    column :created_at
    column :user
    column :status
    actions
  end

  action_item :approve, only: :show do
    link_to 'Approve', approve_admin_review_path(review), method: :put unless review.approved?
  end

  action_item :reject, only: :show do
    link_to 'Reject', reject_admin_review_path(review), method: :put unless review.rejected?
  end

  member_action :approve, method: :put do
    review = Review.find(params[:id])
    review.update(status: 1)
    redirect_to admin_review_path(review)
  end

  member_action :reject, method: :put do
    review = Review.find(params[:id])
    review.update(status: 2)
    redirect_to admin_review_path(review)
  end
end
