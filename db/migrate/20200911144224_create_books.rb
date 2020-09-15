class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, unique: true, null: false
      t.text :description, default: ''
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
