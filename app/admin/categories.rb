ActiveAdmin.register Category do
  permit_params :name
  actions :index, :new, :create, :edit, :update, :destroy
  controller { skip_before_action :set_categories }

  filter :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end
end
