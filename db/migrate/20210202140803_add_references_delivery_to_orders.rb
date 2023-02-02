class AddReferencesDeliveryToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :delivery, index: true, foreign_key: true
  end
end
