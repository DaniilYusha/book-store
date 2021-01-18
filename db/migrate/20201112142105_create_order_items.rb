class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity, null: false
      t.references :order, foreign_key: true, index: true
      t.references :book, foreign_key: true, index: true

      t.timestamps
    end
  end
end
