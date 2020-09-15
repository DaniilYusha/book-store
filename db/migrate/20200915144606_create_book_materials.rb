class CreateBookMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :book_materials do |t|
      t.belongs_to :book, foreign_key: true, index: true
      t.belongs_to :material, foreign_key: true, index: true

      t.timestamps
    end
    add_index :book_materials, %i[book_id material_id]
  end
end
