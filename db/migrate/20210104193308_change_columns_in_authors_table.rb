class ChangeColumnsInAuthorsTable < ActiveRecord::Migration[6.0]
  def change
    change_column :authors, :first_name, :string, null: true
    change_column :authors, :last_name, :string, null: true
  end
end
