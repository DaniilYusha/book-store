class ChangeColumnsInCategoriesTable < ActiveRecord::Migration[6.0]
  def change
    change_column :categories, :name, :string, null: true
  end
end
