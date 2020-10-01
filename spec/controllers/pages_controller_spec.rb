RSpec.describe PagesController, type: :controller do
  describe 'GET /' do
    before do
      create_list(:book, PagesController::LAST_ADDED_BOOKS_COUNT)
      get :home
    end

    it 'assings @latest_books' do
      expect(assigns(:latest_books)).to match_array(
        BookDecorator.decorate_collection(Book.includes(:authors)
        .last(PagesController::LAST_ADDED_BOOKS_COUNT))
      )
    end

    it 'has current path' do
      expect(page).to have_current_path root_path
    end

    it 'returns http success' do
      expect(response).to have_http_status :success
    end

    it 'render home/index template' do
      expect(response).to render_template :index
    end
  end
end
