ActiveAdmin.register Author do
  permit_params :first_name, :last_name

  actions :index, :new, :create, :edit, :update, :destroy

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
