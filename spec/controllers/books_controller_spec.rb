RSpec.describe BooksController, type: :controller do
  let(:book) { create(:book_with_associations).decorate }

  describe 'GET /books' do
    before { visit books_path }

    it 'has current path' do
      expect(page).to have_current_path books_path
    end

    it 'returns http success' do
      expect(response).to have_http_status :success
    end

    it 'render books/index template' do
      expect(response).to render_template :index
    end
  end

  describe 'GET /books/{id}' do
    before { visit book_path(book) }

    it 'has current path' do
      expect(page).to have_current_path book_path(book)
    end

    it 'returns http success' do
      expect(response).to have_http_status :success
    end

    it 'render books/show template' do
      expect(response).to render_template :show
    end
  end
end
