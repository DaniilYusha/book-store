class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.integer :rating, null: false
      t.integer :status, null: false, default: 0
      t.boolean :is_verified, default: false
      t.references :user, foreign_key: true, index: true
      t.references :book, foreign_key: true, index: true

      t.timestamps
    end
  end
end
