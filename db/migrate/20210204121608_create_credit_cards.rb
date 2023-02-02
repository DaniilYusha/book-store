class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.string :number, null: false
      t.string :name, null: false
      t.string :date, null: false
      t.string :cvv, null: false
      t.references :order, index: true, foreign_key: true

      t.timestamps
    end
  end
end
