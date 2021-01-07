ActiveAdmin.register BookImage do
  permit_params :image, :book_id

  index do
    selectable_column
    id_column
    column :book
    column :photo do |book_image|
      image_tag(book_image.image_url(:w170))
    end
    actions
  end

  show do
    attributes_table do
      row :book
      row :photo do |book_image|
        image_tag(book_image.image_url(:w170))
      end
    end
  end
end
