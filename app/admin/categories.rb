ActiveAdmin.register Category do
  permit_params :name

  actions :all, except: :show

  controller do
    skip_before_action :set_categories

    def create
      @category = Category.new(permitted_params[:category])
      persist_category(:new)
    end

    def update
      @category = Category.find_by(id: permitted_params[:id])
      persist_category(:edit)
    end

    private

    def persist_category(view)
      service = Admin::SaveEntitiesService.new(entity: :category, params: permitted_params)

      if service.call
        redirect_to(admin_categories_path, notice: I18n.t('notice.category.saved'))
      else
        @errors = service.errors
        render(view)
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  form partial: 'form'
end
