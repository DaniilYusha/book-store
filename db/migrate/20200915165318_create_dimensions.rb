class CreateDimensions < ActiveRecord::Migration[6.0]
  def change
    create_table :dimensions do |t|
      t.decimal :height, precision: 6, scale: 2, null: false
      t.decimal :width, precision: 6, scale: 2, null: false
      t.decimal :depth, precision: 6, scale: 2, null: false
      t.belongs_to :book, foreign_key: true, index: true

      t.timestamps
    end
  end
end
