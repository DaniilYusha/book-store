RSpec.describe Admin::CategoriesController, type: :controller do
  let(:admin) { create(:admin_user) }
  let(:valid_params) { attributes_for(:category) }
  let(:invalid_params) { attributes_for(:category, name: '') }
  let(:category) { create(:category) }

  before { sign_in(admin) }

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new Category' do
        expect { post :create, params: { category: valid_params } }.to change(Category, :count).by(1)
      end

      it 'redirects to categories list' do
        post :create, params: { category: valid_params }
        expect(response).to have_http_status :found
      end
    end

    context 'with invalid params' do
      before { post :create, params: { category: invalid_params } }

      it 'invalid_params return http success' do
        expect(response).to have_http_status :success
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      before { put :update, params: { id: category.id, category: valid_params } }

      it 'returns http status redirect' do
        expect(response).to have_http_status :redirect
      end
    end
  end
end
