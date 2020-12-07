ActiveAdmin.register Book do
  permit_params :title, :description, :price, :height, :width, :depth,
                :published_at, :category_id, :materials, author_ids: []
  includes :category, :authors

  decorate_with BookDecorator

  controller do
    def create
      @book = Book.new(permitted_params[:book])
      handle_book_params(:new)
    end

    def update
      @book = Book.find_by(id: params[:id])
      handle_book_params(:edit)
    end

    private

    def handle_book_params(view)
      @service = Admin::SaveEntitiesService.new(entity: :book, params: permitted_params)
      @service.call

      @service.errors.any? ? render(view) : redirect_to(admin_books_path, notice: I18n.t('notice.book.saved'))
    end
  end

  filter :authors, as: :select, collection: proc { Author.order(:first_name).decorate }
  filter :category
  filter :title
  filter :price
  filter :published_at

  index do
    selectable_column
    id_column
    column :category
    column :title
    column :authors_list
    column :short_description
    column :price do |book|
      number_to_currency(book.price)
    end
    actions
  end

  show do
    attributes_table do
      row :category
      row :authors_list
      row :title
      row :description
      row :price do |book|
        number_to_currency(book.price)
      end
      row :published_at
      row :height
      row :width
      row :depth
      row :materials_list
    end
  end

  form partial: 'form'
end
