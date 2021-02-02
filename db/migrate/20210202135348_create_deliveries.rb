class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :method
      t.decimal :price
      t.integer :from_days
      t.integer :to_days

      t.timestamps
    end
  end
end
