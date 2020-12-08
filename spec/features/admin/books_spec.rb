RSpec.describe 'admin/books', type: :feature do
  let_it_be(:book) { create(:book) }
  let(:admin) { create(:admin_user) }
  let(:login_page) { Pages::Admin::LogIn.new }

  before do
    login_page.load
    login_page.form.fill_in(admin.email, admin.password)
  end

  describe '#index' do
    let(:books_page) { Pages::Admin::Books.new }

    before { books_page.load }

    it { expect(books_page.filters).to have_header }
    it { expect(books_page.filters).to have_filter_fields(count: 5) }
    it { expect(books_page.filters).to have_filter_button }
    it { expect(books_page.filters).to have_clear_filters_button }

    it { expect(books_page.main_content).to have_id_column }
    it { expect(books_page.main_content).to have_category_column }
    it { expect(books_page.main_content).to have_title_column }
    it { expect(books_page.main_content).to have_description_column }
    it { expect(books_page.main_content).to have_authors_column }
    it { expect(books_page.main_content).to have_price_column }
  end

  describe '#show' do
    let(:book_page) { Pages::Admin::Book.new }

    before { book_page.load(id: book.id) }

    it { expect(book_page.book_details).to have_header }
    it { expect(book_page.book_details).to have_category_row }
    it { expect(book_page.book_details).to have_authors_list_row }
    it { expect(book_page.book_details).to have_title_row }
    it { expect(book_page.book_details).to have_description_row }
    it { expect(book_page.book_details).to have_price_row }
    it { expect(book_page.book_details).to have_published_at_row }
    it { expect(book_page.book_details).to have_height_row }
    it { expect(book_page.book_details).to have_width_row }
    it { expect(book_page.book_details).to have_depth_row }
    it { expect(book_page.book_details).to have_materials_row }
  end

  describe '#new' do
    let(:new_book_page) { Pages::Admin::NewBook.new }

    before { new_book_page.load }

    it { expect(new_book_page.fields).to have_category_input }
    it { expect(new_book_page.fields).to have_authors_input }
    it { expect(new_book_page.fields).to have_title_input }
    it { expect(new_book_page.fields).to have_description_input }
    it { expect(new_book_page.fields).to have_price_input }
    it { expect(new_book_page.fields).to have_published_at_input }
    it { expect(new_book_page.fields).to have_height_input }
    it { expect(new_book_page.fields).to have_width_input }
    it { expect(new_book_page.fields).to have_depth_input }
    it { expect(new_book_page.fields).to have_materials_input }
    it { expect(new_book_page.fields).to have_title_image_input }
    it { expect(new_book_page.fields).to have_images_input }
    it { expect(new_book_page.fields).to have_create_button }
    it { expect(new_book_page.fields).to have_cancel_button }
  end
end
