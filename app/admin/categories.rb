ActiveAdmin.register Category do
  permit_params :name

  actions :all, except: :show

  index do
    selectable_column
    id_column
    column :name
    actions
  end
end
