ActiveAdmin.register Book do
  permit_params :title, :description, :price, :height, :width, :depth,
                :published_at, :category_id, :image,
                material_ids: [], author_ids: []
  includes :category, :materials

  decorate_with BookDecorator

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
    column :materials
    column :description do |book|
      book.short_description
    end
    column :authors do |book|
      book.authors.decorate.each do |author|
        link_to author.name, admin_author_path(author)
      end
    end
    column :price
    column :published_at
    actions
  end

  show do
    attributes_table do
      row :category
      row :authors_list
      row :title
      row :description
      row :price
      row :published_at
      row :height
      row :width
      row :depth
      row :materials
    end
  end

  form do |_f|
    inputs 'Details' do
      input :category
      input :authors, collection: Author.all.decorate
      input :title
      input :description
      input :price
      input :published_at, as: :datepicker
      input :height
      input :width
      input :depth
      input :materials
      input :image
    end
    actions
  end
end
