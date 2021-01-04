RSpec.describe 'admin/books', type: :feature do
  let_it_be(:category) { create(:category) }
  let_it_be(:author) { create(:author).decorate }
  let(:admin) { create(:admin_user) }

  before { login_as(admin) }

  describe '/index' do
    let_it_be(:book) { create(:book).decorate }
    let(:books_page) { Pages::Admin::Books.new }

    before { books_page.load }

    context 'with page elements' do
      it { expect(books_page.filters).to have_header }
      it { expect(books_page.filters).to have_filter_fields }
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
      it { expect(book_page.book_details).to have_materials_row }
      it { expect(book_page.book_details.category_row.text).to have_content(book.category.name) }
      it { expect(book_page.book_details.materials_row.text).to have_content(book.materials_list) }

      %i[authors_list title description price height width depth].each do |field|
        it { expect(book_page.book_details).to public_send("have_#{field}_row") }
        it { expect(book_page.book_details.public_send("#{field}_row").text).to have_content(book.public_send(field)) }
      end
    end
  end

  describe '/new' do
    let(:new_book_page) { Pages::Admin::NewBook.new }

    before { new_book_page.load }

    context 'with page elements' do
      %i[category_select authors_checkboxes description_input price_input published_at_input height_input
         width_input depth_input materials_input create_button cancel_button].each do |element|
        it { expect(new_book_page.fields).to public_send("have_#{element}") }
      end
    end

    context 'when fill in form with valid params' do
      let(:book_category) { { category: category.name } }
      let(:book_params) { attributes_for(:book).merge(book_category) }

      before { new_book_page.fields.submit(book_params) }

      it { expect(new_book_page.text).to have_content(I18n.t('notice.book.created')) }
      it { expect(new_book_page.text).to have_content(category.name) }
      it { expect(new_book_page.text).to have_content(author.full_name) }
      it { expect(new_book_page.text).to have_content(book_params[:title]) }
      it { expect(new_book_page.text).to have_content(book_params[:price]) }

      it {
        expect(new_book_page.text).to have_content(
          book_params[:description].truncate(BookDecorator::SHORT_DESCRIPTION_LENGTH)
        )
      }
    end

    context 'when fill in form with invalid params' do
      let(:book_category) { { category: '' } }
      let(:book_params) { attributes_for(:book).merge(book_category) }

      before { new_book_page.fields.submit(book_params) }

      it { expect(new_book_page.text).to have_content(I18n.t('alert.must_exist')) }
      it { expect(new_book_page.fields.title_input.value).to have_content(book_params[:title]) }
      it { expect(new_book_page.fields.description_input.value).to have_content(book_params[:description]) }
      it { expect(new_book_page.fields.price_input.value).to have_content(book_params[:price]) }
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
      it { expect(edit_book_page.fields).to have_create_button }
      it { expect(edit_book_page.fields).to have_cancel_button }

      %i[title description price published_at height width depth materials].each do |field|
        it { expect(edit_book_page.fields).to public_send("have_#{field}_input") }

        it {
          expect(edit_book_page.fields.public_send("#{field}_input").value)
            .to have_content(book.public_send(field))
        }
      end
    end

    context 'when fill in form with valid params' do
      let(:book_category) { { category: category.name } }
      let(:book_params) { attributes_for(:book).merge(book_category) }

      before { edit_book_page.fields.submit(book_params) }

      it { expect(edit_book_page.text).to have_content(I18n.t('notice.book.updated')) }
      it { expect(edit_book_page.text).to have_content(category.name) }
      it { expect(edit_book_page.text).to have_content(author.full_name) }
      it { expect(edit_book_page.text).to have_content(book_params[:title]) }
      it { expect(edit_book_page.text).to have_content(book_params[:price]) }

      it {
        expect(edit_book_page.text).to have_content(
          book_params[:description].truncate(BookDecorator::SHORT_DESCRIPTION_LENGTH)
        )
      }
    end

    context 'when fill in form with invalid params' do
      let(:book_category) { { category: '' } }
      let(:book_params) { attributes_for(:book).merge(book_category) }

      before { edit_book_page.fields.submit(book_params) }

      it { expect(edit_book_page.text).to have_content(I18n.t('alert.must_exist')) }
      it { expect(edit_book_page.fields.category_select.text).to have_content(category.name) }
      it { expect(edit_book_page.fields.title_input.value).to have_content(book_params[:title]) }
      it { expect(edit_book_page.fields.description_input.value).to have_content(book_params[:description]) }
      it { expect(edit_book_page.fields.price_input.value).to have_content(book_params[:price]) }
      it { expect(edit_book_page.fields.height_input.value).to have_content(book_params[:height]) }
      it { expect(edit_book_page.fields.width_input.value).to have_content(book_params[:width]) }
      it { expect(edit_book_page.fields.depth_input.value).to have_content(book_params[:depth]) }
      it { expect(edit_book_page.fields.materials_input.value).to have_content(book_params[:materials]) }
    end
  end
end
