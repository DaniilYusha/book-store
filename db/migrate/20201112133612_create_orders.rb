class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :status, null: false, default: 0
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
