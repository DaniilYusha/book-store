ActiveAdmin.register Author do
  permit_params :first_name, :last_name

  actions :index, :new, :create, :edit, :update, :destroy

  controller do
    def create
      @author = Author.new(permitted_params[:author])
      handle_author_params(:new)
    end

    def update
      @author = Author.find_by(id: params[:id])
      handle_author_params(:edit)
    end

    private

    def handle_author_params(view)
      service = Admin::SaveEntitiesService.new(entity: :author, params: permitted_params)

      if service.call
        redirect_to(admin_authors_path, notice: I18n.t('notice.author.saved'))
      else
        @errors = service.errors
        render(view)
      end
    end
  end

  filter :first_name
  filter :last_name
  filter :books

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    actions
  end

  form partial: 'form'
end
