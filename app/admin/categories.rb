ActiveAdmin.register Category do
  permit_params :name
  actions :index, :new, :create, :edit, :update, :destroy

  controller do
    skip_before_action :set_categories

    def create
      handle_category_params
    end

    def update
      handle_category_params
    end

    private

    def handle_category_params
      service = SaveCategoryService.new(permitted_params)
      service.call

      if service.errors.empty?
        redirect_to admin_categories_path, notice: I18n.t('notice.category.saved')
      else
        flash.alert = service.errors.full_messages.to_sentence
        redirect_back fallback_location: admin_categories_path
      end
    end
  end

  filter :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end
end
