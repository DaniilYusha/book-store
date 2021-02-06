# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_205_125_258) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'address', null: false
    t.string 'city', null: false
    t.string 'zip_code', null: false
    t.string 'country', null: false
    t.string 'phone', null: false
    t.integer 'address_type', null: false
    t.string 'addressable_type'
    t.bigint 'addressable_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[addressable_type addressable_id], name: 'index_addresses_on_addressable_type_and_addressable_id'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'author_books', force: :cascade do |t|
    t.bigint 'author_id'
    t.bigint 'book_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['author_id'], name: 'index_author_books_on_author_id'
    t.index ['book_id'], name: 'index_author_books_on_book_id'
  end

  create_table 'authors', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'book_images', force: :cascade do |t|
    t.string 'image'
    t.bigint 'book_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['book_id'], name: 'index_book_images_on_book_id'
  end

  create_table 'books', force: :cascade do |t|
    t.string 'title'
    t.text 'description', default: ''
    t.decimal 'price'
    t.decimal 'height'
    t.decimal 'width'
    t.decimal 'depth'
    t.date 'published_at'
    t.string 'materials'
    t.bigint 'category_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'title_image'
    t.index ['category_id'], name: 'index_books_on_category_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'coupons', force: :cascade do |t|
    t.string 'code', null: false
    t.decimal 'discount', precision: 8, scale: 2, null: false
    t.boolean 'is_valid', default: true
    t.bigint 'order_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['order_id'], name: 'index_coupons_on_order_id'
  end

  create_table 'credit_cards', force: :cascade do |t|
    t.string 'number', null: false
    t.string 'name', null: false
    t.string 'date', null: false
    t.string 'cvv', null: false
    t.bigint 'order_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['order_id'], name: 'index_credit_cards_on_order_id'
  end

  create_table 'deliveries', force: :cascade do |t|
    t.string 'method'
    t.decimal 'price'
    t.integer 'from_days'
    t.integer 'to_days'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'order_items', force: :cascade do |t|
    t.integer 'quantity', null: false
    t.bigint 'order_id'
    t.bigint 'book_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['book_id'], name: 'index_order_items_on_book_id'
    t.index ['order_id'], name: 'index_order_items_on_order_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'status', default: 0, null: false
    t.bigint 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'delivery_id'
    t.string 'number'
    t.index ['delivery_id'], name: 'index_orders_on_delivery_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.string 'title', null: false
    t.text 'text', null: false
    t.integer 'rating', null: false
    t.integer 'status', default: 0, null: false
    t.boolean 'is_verified', default: false
    t.bigint 'user_id'
    t.bigint 'book_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['book_id'], name: 'index_reviews_on_book_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'provider'
    t.string 'uid'
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'author_books', 'authors'
  add_foreign_key 'author_books', 'books'
  add_foreign_key 'book_images', 'books'
  add_foreign_key 'books', 'categories'
  add_foreign_key 'coupons', 'orders'
  add_foreign_key 'credit_cards', 'orders'
  add_foreign_key 'order_items', 'books'
  add_foreign_key 'order_items', 'orders'
  add_foreign_key 'orders', 'deliveries'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'reviews', 'books'
  add_foreign_key 'reviews', 'users'
end
