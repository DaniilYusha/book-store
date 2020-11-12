ActiveAdmin.register Book do
  permit_params :title, :description, :price, :height, :width, :depth,
                :published_at, :category_id, :title_image, images: [],
                                                           material_ids: [], author_ids: []
  includes :category, :authors

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
      book.authors.each do |author|
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

  form do |f|
    f.inputs 'Details' do
      f.input :category
      f.input :authors, collection: Author.all.decorate
      f.input :title
      f.input :description
      f.input :price
      f.input :published_at, as: :datepicker
      f.input :height
      f.input :width
      f.input :depth
      f.input :materials
<<<<<<< HEAD
      f.input :title_image, as: :file
      f.input :images, as: :file, input_html: { multiple: true }
=======
>>>>>>> feature/sixth_step
    end
    actions
  end
end
