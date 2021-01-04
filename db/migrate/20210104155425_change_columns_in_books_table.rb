class ChangeColumnsInBooksTable < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :title, :string, null: true
    change_column :books, :price, :decimal, null: true
    change_column :books, :height, :decimal, null: true
    change_column :books, :width, :decimal, null: true
    change_column :books, :depth, :decimal, null: true
    change_column :books, :published_at, :date, null: true
    change_column :books, :materials, :string, null: true
  end
end
