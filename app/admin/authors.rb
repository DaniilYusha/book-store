ActiveAdmin.register Author do
  permit_params :first_name, :last_name

  actions :all, except: :show

  remove_filter :author_books

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    actions
  end
end
