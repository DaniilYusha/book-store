RSpec.describe Admin::AuthorsController, type: :controller do
  let(:admin) { create(:admin_user) }
  let(:valid_params) { attributes_for(:author) }
  let(:invalid_params) { attributes_for(:category, first_name: '') }

  before { sign_in(admin) }

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new Author' do
        expect { post :create, params: { author: valid_params } }.to change(Author, :count).by(1)
      end

      it 'redirects to authors list' do
        post :create, params: { author: valid_params }
        expect(response).to have_http_status :found
      end
    end

    context 'with invalid params' do
      before { post :create, params: { author: invalid_params } }

      it 'invalid_params return http success' do
        expect(response).to have_http_status :success
      end
    end
  end

  describe 'PUT update' do
    let(:author) { create(:author) }

    context 'with valid params' do
      before { put :update, params: { id: author.id, author: valid_params } }

      it 'returns http status redirect' do
        expect(response).to have_http_status :redirect
      end
    end

    context 'with invalid params' do
      before { put :update, params: { id: author.id, author: invalid_params } }

      it 'returns http status redirect' do
        expect(response).to have_http_status :success
      end
    end
  end
end
