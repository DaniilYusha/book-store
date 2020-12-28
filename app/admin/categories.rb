ActiveAdmin.register Category do
  permit_params :name
  actions :index, :new, :create, :edit, :update, :destroy

  controller do
    skip_before_action :set_categories

    def create
      @category = Category.new(permitted_params[:category])
      handle_category_params(:new)
    end

    def update
      @category = Category.find_by(id: permitted_params[:id])
      handle_category_params(:edit)
    end

    private

    def handle_category_params(view)
      service = Admin::SaveEntitiesService.new(entity: :category, params: permitted_params)

      if service.call
        redirect_to(admin_categories_path, notice: I18n.t('notice.category.saved'))
      else
        @errors = service.errors
        render(view)
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

  form partial: 'form'
end
