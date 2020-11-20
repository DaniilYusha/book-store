class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, unique: true, null: false
      t.text :description, default: ''
      t.decimal :price, precision: 8, scale: 2, null: false
      t.decimal :height, precision: 6, scale: 2, null: false
      t.decimal :width, precision: 6, scale: 2, null: false
      t.decimal :depth, precision: 6, scale: 2, null: false
      t.date :published_at, null: false
      t.string :materials, unique: true, null: false
      t.references :category, foreign_key: true, index: true

      t.timestamps
    end
  end
end
