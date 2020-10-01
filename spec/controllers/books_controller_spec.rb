RSpec.describe BooksController, type: :controller do
  describe 'GET /books' do
    it 'assigns @books_count' do
      create_list(:book, 3)
      get :index
      expect(assigns(:books_count)).to eq Book.count
    end

    it 'assings @books' do
      categories = create_list(:category, 3)
      get :index
      expect(assigns(:books)).to match_array(SortedBooksQuery.new(categories).all.decorate)
    end

    it 'assigns @current_category' do
      get :index, params: { category_id: 1 }
      expect(assigns(:current_category)).to eq '1'
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status :success
    end

    it 'render books/index template' do
      get :index
      expect(response).to render_template :index
    end

    it 'has current path' do
      visit books_path
      expect(page).to have_current_path books_path
    end
  end

  describe 'GET /books/{id}' do
    let(:book) { create(:book_with_associations).decorate }

    it 'assigns @book' do
      get :show, params: { id: book.id }
      expect(assigns(:book)).to eq Book.includes(:authors).find(book.id).decorate
    end

    it 'returns http success' do
      get :show, params: { id: book.id }
      expect(response).to have_http_status :success
    end

    it 'render books/show template' do
      get :show, params: { id: book.id }
      expect(response).to render_template :show
    end

    it 'has current path' do
      visit book_path(book)
      expect(page).to have_current_path book_path(book)
    end
  end
end
