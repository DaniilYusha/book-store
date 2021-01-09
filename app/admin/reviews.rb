ActiveAdmin.register Review do
  permit_params :title, :text, :rating, :status, :is_verified, :user_id, :book_id
  includes :book, :user
  decorate_with ReviewDecorator

  actions :index, :show

  scope :unprocessed, default: true
  scope :approved
  scope :rejected

  config.filters = false

  controller do
    private

    def update_review_status(status:, ids:)
      batch_action_collection.find(ids).each(&status.to_sym)
      redirect_back(fallback_location: admin_reviews_path)
    end

    def update_review_status_for_member_action(status)
      review = Review.find(permitted_params[:id])
      review.update(status: status)
      redirect_to admin_review_path(review)
    end
  end

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
    update_review_status(status: :approved!, ids: ids)
  end

  batch_action :reject, if: proc { @current_scope.scope_method != :rejected } do |ids|
    update_review_status(status: :rejected!, ids: ids)
  end

  action_item :approve, only: :show do
    link_to I18n.t('links.approve'), approve_admin_review_path(review), method: :put unless review.approved?
  end

  action_item :reject, only: :show do
    link_to I18n.t('links.reject'), reject_admin_review_path(review), method: :put unless review.rejected?
  end

  member_action :approve, method: :put do
    update_review_status_for_member_action(:approved)
  end

  member_action :reject, method: :put do
    update_review_status_for_member_action(:rejected)
  end
end
