class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.string :code, unique: true, null: false
      t.decimal :discount, precision: 8, scale: 2, null: false
      t.boolean :is_valid, default: true
      t.references :order, foreign_key: true, index: true

      t.timestamps
    end
  end
end
