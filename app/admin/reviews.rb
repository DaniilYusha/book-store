ActiveAdmin.register Review do
  permit_params :title, :text, :rating, :status, :is_verified, :user_id, :book_id
  includes :book, :user
  decorate_with ReviewDecorator

  actions :index, :show

  scope :unprocessed, default: true
  scope :approved
  scope :rejected

  config.filters = false

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

  batch_action :approve, if: proc { @current_scope.scope_method != :approved } do |ids|
    batch_action_collection.find(ids).each(&:approved!)
    redirect_back(fallback_location: admin_reviews_path)
  end

  batch_action :reject, if: proc { @current_scope.scope_method != :rejected } do |ids|
    batch_action_collection.find(ids).each(&:rejected!)
    redirect_back(fallback_location: admin_reviews_path)
  end

  action_item :approve, only: :show do
    link_to I18n.t('links.approve'), approve_admin_review_path(review), method: :put unless review.approved?
  end

  action_item :reject, only: :show do
    link_to I18n.t('links.reject'), reject_admin_review_path(review), method: :put unless review.rejected?
  end

  member_action :approve, method: :put do
    review = Review.find(permitted_params[:id])
    review.update(status: :approved)
    redirect_to admin_review_path(review)
  end

  member_action :reject, method: :put do
    review = Review.find(permitted_params[:id])
    review.update(status: :rejected)
    redirect_to admin_review_path(review)
  end
end
