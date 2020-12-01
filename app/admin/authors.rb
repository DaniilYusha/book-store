ActiveAdmin.register Author do
  permit_params :first_name, :last_name

  actions :index, :new, :create, :edit, :update, :destroy

  controller do
    def create
      handle_author_params
    end

    def update
      handle_author_params
    end

    private

    def handle_author_params
      service = SaveAuthorService.new(permitted_params)
      service.call

      if service.errors.empty?
        redirect_to admin_authors_path, notice: I18n.t('notice.author.saved')
      else
        flash.alert = service.errors.full_messages.to_sentence
        redirect_back fallback_location: admin_authors_path
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
end
