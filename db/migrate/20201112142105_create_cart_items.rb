class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.integer :quantity, null: false
      t.references :cart, foreign_key: true, index: true
      t.references :book, foreign_key: true, index: true

      t.timestamps
    end
  end
end
