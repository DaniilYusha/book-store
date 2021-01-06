ActiveAdmin.register BookImage do
  permit_params :image, :book_id

  index do
    selectable_column

    column :photo do |book|
      image_tag(book.image_url(:w170))
    end

    column :book_id do |book|
      Book.find_by(id: BookImage.find_by(id: book.id).book_id)
    end

    actions
  end

  show do
    attributes_table do
      row :book_id do |book|
        Book.find_by(id: BookImage.find_by(id: book.id).book_id)
      end

      row :photo do |book|
        image_tag(book.image_url(:w170))
      end
    end
  end
end
