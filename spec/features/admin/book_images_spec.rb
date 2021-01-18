RSpec.describe 'admin/book_images', type: :feature do
  let_it_be(:book) { create(:book) }
  let_it_be(:book_image) { create(:book_image, book: book) }
  let(:admin) { create(:admin_user) }

  before { login_as(admin) }

  describe '/index' do
    let(:book_images_page) { Pages::Admin::BookImages::Index.new }

    before { book_images_page.load }

    context 'with page elements' do
      it { expect(book_images_page.main_content).to have_id_column }
      it { expect(book_images_page.main_content).to have_book_column }
      it { expect(book_images_page.main_content).to have_image_column }

      it { expect(book_images_page.main_content).to have_content(book_image.id) }
      it { expect(book_images_page.main_content.find('img')['src']).to have_content(book_image.image_url(:w170)) }
      it { expect(book_images_page.main_content).to have_content(book.title) }
    end
  end

  describe '/show' do
    let(:book_image_page) { Pages::Admin::BookImages::Show.new }

    before { book_image_page.load(id: book_image.id) }

    context 'with page elements' do
      it { expect(book_image_page.details).to have_header }
      it { expect(book_image_page.details).to have_book_row }
      it { expect(book_image_page.details).to have_image_row }

      it { expect(book_image_page.details.book_row).to have_content(book.title) }
      it { expect(book_image_page.details.find('img')['src']).to have_content(book_image.image_url(:w170)) }
    end
  end

  describe '/new' do
    let(:new_book_image_page) { Pages::Admin::BookImages::New.new }

    before { new_book_image_page.load }

    context 'with page elements' do
      it { expect(new_book_image_page.fields).to have_book_select }
      it { expect(new_book_image_page.fields).to have_image_input }
      it { expect(new_book_image_page.fields).to have_create_button }
      it { expect(new_book_image_page.fields).to have_cancel_button }
    end

    context 'when fill in form with invalid params' do
      let(:book_image_params) { attributes_for(:book_image).merge(book: '') }

      before { new_book_image_page.fields.submit(book_image_params) }

      it { expect(new_book_image_page.text).to have_content(I18n.t('alert.must_exist')) }
      it { expect(new_book_image_page).to have_content(book_image_params[:title]) }
    end

    context 'when fill in form with valid params' do
      let(:book_image_params) { attributes_for(:book_image).merge(book: book.title) }

      before { new_book_image_page.fields.submit(book_image_params) }

      it { expect(new_book_image_page).to have_content(I18n.t('notice.book_image.created')) }
      it { expect(new_book_image_page).to have_content(book.title) }
    end
  end

  describe '/edit' do
    let(:edit_book_image_page) { Pages::Admin::BookImages::Edit.new }

    before { edit_book_image_page.load(id: book_image.id) }

    context 'with page elements' do
      it { expect(edit_book_image_page.fields).to have_book_select }
      it { expect(edit_book_image_page.fields).to have_image_input }
      it { expect(edit_book_image_page.fields).to have_create_button }
      it { expect(edit_book_image_page.fields).to have_cancel_button }

      it { expect(edit_book_image_page).to have_content(book.title) }
    end

    context 'when fill in form with invalid params' do
      let(:book_image_params) { attributes_for(:book_image).merge(book: '') }

      before { edit_book_image_page.fields.submit(book_image_params) }

      it { expect(edit_book_image_page.text).to have_content(I18n.t('alert.must_exist')) }
      it { expect(edit_book_image_page).to have_content(book_image_params[:title]) }
    end

    context 'when fill in form with valid params' do
      let(:book_image_params) { attributes_for(:book_image).merge(book: book.title) }

      before { edit_book_image_page.fields.submit(book_image_params) }

      it { expect(edit_book_image_page).to have_content(I18n.t('notice.book_image.updated')) }
      it { expect(edit_book_image_page).to have_content(book_image_params[:title]) }
    end
  end
end
