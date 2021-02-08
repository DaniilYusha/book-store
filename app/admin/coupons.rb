ActiveAdmin.register Coupon do
  permit_params :code, :discount

  config.filters = false

  index do
    selectable_column
    id_column
    column :code
    column :discount
    actions
  end

  form do |f|
    f.inputs do
      f.input :code
      f.input :discount
    end
    actions
  end
end
