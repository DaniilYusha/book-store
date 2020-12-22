RSpec.describe Admin::BooksController, type: :controller do
  let(:admin) { create(:admin_user) }
  let(:category) { create(:category) }
  let(:author) { create(:author) }
  let(:book) { create(:book) }
  let(:valid_params) { attributes_for(:book, category_id: category.id, author_ids: [author.id]) }
  let(:invalid_params) { attributes_for(:book, title: '') }

  before { sign_in(admin) }

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new Book' do
        expect { post :create, params: { book: valid_params } }.to change(Book, :count).by(1)
      end

      it 'redirects to books list' do
        post :create, params: { book: valid_params }
        expect(response).to have_http_status :found
      end
    end

    context 'with invalid params' do
      before { post :create, params: { book: invalid_params } }

      it 'invalid_params return http success' do
        expect(response).to have_http_status :success
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      before { put :update, params: { id: book.id, book: valid_params } }

      it 'returns http status redirect' do
        expect(response).to have_http_status :redirect
      end
    end
  end
end