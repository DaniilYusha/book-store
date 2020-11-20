RSpec.describe BooksController, type: :controller do
  describe 'GET /books' do
    before { get :index }

    it { expect(response).to have_http_status :success }
  end

  describe 'GET /books/{id}' do
    let(:book) { create(:book) }

    before { get :show, params: { id: book.id } }

    it { expect(response).to have_http_status :success }
  end
end
