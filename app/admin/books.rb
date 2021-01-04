ActiveAdmin.register Book do
  permit_params :title, :description, :price, :height, :width, :depth,
                :published_at, :category_id, :materials, author_ids: []
  includes :category, :authors

  decorate_with BookDecorator

  preserve_default_filters!
  remove_filter :author_books
  filter :authors, as: :select, collection: proc { Author.order(:first_name).decorate }

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

  form do |f|
    f.inputs do
      f.input :category
      f.input :authors, as: :check_boxes, collection: Author.all.decorate
      f.input :title
      f.input :description
      f.input :price
      f.input :published_at, as: :datepicker
      f.input :height
      f.input :width
      f.input :depth
      f.input :materials
    end
    actions
  end
end
