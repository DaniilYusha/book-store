RSpec.describe 'admin/books', type: :feature do
  let_it_be(:category) { create(:category) }
  let_it_be(:author) { create(:author).decorate }
  let(:admin) { create(:admin_user) }
  let(:login_page) { Pages::Admin::LogIn.new }

  before do
    login_page.load
    login_page.form.fill_in(admin.email, admin.password)
  end

  describe '/index' do
    let_it_be(:book) { create(:book).decorate }
    let(:books_page) { Pages::Admin::Books.new }

    before { books_page.load }

    context 'with page elements' do
      it { expect(books_page.filters).to have_header }
      it { expect(books_page.filters).to have_filter_fields(count: 5) }
      it { expect(books_page.filters).to have_filter_button }
      it { expect(books_page.filters).to have_clear_filters_button }

      it { expect(books_page.main_content).to have_id_column }
      it { expect(books_page.main_content.text).to have_content(book.id) }
      it { expect(books_page.main_content).to have_category_column }
      it { expect(books_page.main_content.text).to have_content(book.category.name) }
      it { expect(books_page.main_content).to have_title_column }
      it { expect(books_page.main_content.text).to have_content(book.title) }
      it { expect(books_page.main_content).to have_description_column }
      it { expect(books_page.main_content.text).to have_content(book.short_description) }
      it { expect(books_page.main_content).to have_authors_column }
      it { expect(books_page.main_content.text).to have_content(book.authors_list) }
      it { expect(books_page.main_content).to have_price_column }
      it { expect(books_page.main_content.text).to have_content(book.price) }
    end
  end

  describe '/show' do
    let_it_be(:book) { create(:book).decorate }
    let(:book_page) { Pages::Admin::Book.new }

    before { book_page.load(id: book.id) }

    context 'with page elements' do
      it { expect(book_page.book_details).to have_header }
      it { expect(book_page.book_details).to have_category_row }
      it { expect(book_page.book_details.category_row.text).to have_content(book.category.name) }
      it { expect(book_page.book_details).to have_authors_list_row }
      it { expect(book_page.book_details.authors_list_row.text).to have_content(book.authors_list) }
      it { expect(book_page.book_details).to have_title_row }
      it { expect(book_page.book_details.title_row.text).to have_content(book.title) }
      it { expect(book_page.book_details).to have_description_row }
      it { expect(book_page.book_details.description_row.text).to have_content(book.description) }
      it { expect(book_page.book_details).to have_price_row }
      it { expect(book_page.book_details.price_row.text).to have_content(book.price) }
      it { expect(book_page.book_details).to have_published_at_row }
      it { expect(book_page.book_details).to have_height_row }
      it { expect(book_page.book_details.height_row.text).to have_content(book.height) }
      it { expect(book_page.book_details).to have_width_row }
      it { expect(book_page.book_details.width_row.text).to have_content(book.width) }
      it { expect(book_page.book_details).to have_depth_row }
      it { expect(book_page.book_details.depth_row.text).to have_content(book.depth) }
      it { expect(book_page.book_details).to have_materials_row }
      it { expect(book_page.book_details.materials_row.text).to have_content(book.materials_list) }
    end
  end

  describe '/new' do
    let(:new_book_page) { Pages::Admin::NewBook.new }

    before { new_book_page.load }

    context 'with page elements' do
      it { expect(new_book_page.fields).to have_category_select }
      it { expect(new_book_page.fields).to have_authors_checkboxes }
      it { expect(new_book_page.fields).to have_title_input }
      it { expect(new_book_page.fields).to have_description_input }
      it { expect(new_book_page.fields).to have_price_input }
      it { expect(new_book_page.fields).to have_published_at_input }
      it { expect(new_book_page.fields).to have_height_input }
      it { expect(new_book_page.fields).to have_width_input }
      it { expect(new_book_page.fields).to have_depth_input }
      it { expect(new_book_page.fields).to have_materials_input }
      it { expect(new_book_page.fields).to have_create_button }
      it { expect(new_book_page.fields).to have_cancel_button }
    end

    context 'when fill in form with valid params' do
      let(:book_category) { { category: category.name } }
      let(:book_params) { attributes_for(:book).merge(book_category) }

      before { new_book_page.fields.submit(book_params) }

      it { expect(new_book_page.text).to have_content(I18n.t('notice.book.saved')) }
      it { expect(new_book_page.text).to have_content(category.name) }
      it { expect(new_book_page.text).to have_content(author.full_name) }
      it { expect(new_book_page.text).to have_content(book_params[:title]) }
      it { expect(new_book_page.text).to have_content(book_params[:description]) }
      it { expect(new_book_page.text).to have_content(book_params[:price]) }
    end

    context 'when fill in form with invalid params' do
      let(:book_category) { { category: category.name } }
      let(:book_params) { attributes_for(:book, price: '').merge(book_category) }

      before { new_book_page.fields.submit(book_params) }

      it { expect(new_book_page.text).to have_content(I18n.t('alert.blank')) }
      it { expect(new_book_page.fields.category_select.value).to have_content(category.id) }
      it { expect(new_book_page.fields.title_input.value).to have_content(book_params[:title]) }
      it { expect(new_book_page.fields.description_input.value).to have_content(book_params[:description]) }
      it { expect(new_book_page.fields.height_input.value).to have_content(book_params[:height]) }
      it { expect(new_book_page.fields.width_input.value).to have_content(book_params[:width]) }
      it { expect(new_book_page.fields.depth_input.value).to have_content(book_params[:depth]) }
      it { expect(new_book_page.fields.materials_input.value).to have_content(book_params[:materials]) }
    end
  end

  describe '/edit' do
    let_it_be(:book) { create(:book) }

    let(:edit_book_page) { Pages::Admin::EditBook.new }

    before { edit_book_page.load(id: book.id) }

    context 'with page elements' do
      it { expect(edit_book_page.fields).to have_category_select }
      it { expect(edit_book_page.fields.category_select.text).to have_content(category.name) }
      it { expect(edit_book_page.fields).to have_title_input }
      it { expect(edit_book_page.fields.title_input.value).to have_content(book.title) }
      it { expect(edit_book_page.fields).to have_description_input }
      it { expect(edit_book_page.fields.description_input.value).to have_content(book.description) }
      it { expect(edit_book_page.fields).to have_price_input }
      it { expect(edit_book_page.fields.price_input.value).to have_content(book.price) }
      it { expect(edit_book_page.fields).to have_published_at_input }
      it { expect(edit_book_page.fields.published_at_input.value).to have_content(book.published_at) }
      it { expect(edit_book_page.fields).to have_height_input }
      it { expect(edit_book_page.fields.height_input.value).to have_content(book.height) }
      it { expect(edit_book_page.fields).to have_width_input }
      it { expect(edit_book_page.fields.width_input.value).to have_content(book.width) }
      it { expect(edit_book_page.fields).to have_depth_input }
      it { expect(edit_book_page.fields.depth_input.value).to have_content(book.depth) }
      it { expect(edit_book_page.fields).to have_materials_input }
      it { expect(edit_book_page.fields.materials_input.value).to have_content(book.materials) }
      it { expect(edit_book_page.fields).to have_create_button }
      it { expect(edit_book_page.fields).to have_cancel_button }
    end

    context 'when fill in form with valid params' do
      let(:book_category) { { category: category.name } }
      let(:book_params) { attributes_for(:book).merge(book_category) }

      before { edit_book_page.fields.submit(book_params) }

      it { expect(edit_book_page.text).to have_content(I18n.t('notice.book.saved')) }
      it { expect(edit_book_page.text).to have_content(category.name) }
      it { expect(edit_book_page.text).to have_content(author.full_name) }
      it { expect(edit_book_page.text).to have_content(book_params[:title]) }
      it { expect(edit_book_page.text).to have_content(book_params[:description]) }
      it { expect(edit_book_page.text).to have_content(book_params[:price]) }
    end

    context 'when fill in form with invalid params' do
      let(:book_category) { { category: category.name } }
      let(:book_params) { attributes_for(:book, price: '').merge(book_category) }

      before { edit_book_page.fields.submit(book_params) }

      it { expect(edit_book_page.text).to have_content(I18n.t('alert.blank')) }
      it { expect(edit_book_page.fields.category_select.text).to have_content(category.name) }
      it { expect(edit_book_page.fields.title_input.value).to have_content(book.title) }
      it { expect(edit_book_page.fields.description_input.value).to have_content(book.description) }
      it { expect(edit_book_page.fields.price_input.value).to have_content(book.price) }
      it { expect(edit_book_page.fields.height_input.value).to have_content(book.height) }
      it { expect(edit_book_page.fields.width_input.value).to have_content(book.width) }
      it { expect(edit_book_page.fields.depth_input.value).to have_content(book.depth) }
      it { expect(edit_book_page.fields.materials_input.value).to have_content(book.materials) }
    end
  end
end
