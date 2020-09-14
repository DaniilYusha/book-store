class CreateAuthorBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :author_books do |t|
      t.belongs_to :author, foreign_key: true, index: true
      t.belongs_to :book, foreign_key: true, index: true

      t.timestamps
    end
    add_index :author_books, %i[author_id book_id]
  end
end
