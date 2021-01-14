RSpec.describe Admin::CategoriesController, type: :controller do
  let(:admin) { create(:admin_user) }

  before { sign_in(admin) }

  describe 'POST create' do
    before { post :create, params: { category: params } }

    context 'with valid params' do
      let(:params) { attributes_for(:category) }

      it { expect(response).to redirect_to(admin_categories_path) }
      it { expect(response).to have_http_status(:found) }
    end
  end

  describe 'PUT update' do
    let(:category) { create(:category) }

    before { put :update, params: { id: category.id, category: params } }

    context 'with valid params' do
      let(:params) { attributes_for(:category) }

      it { expect(response).to redirect_to(admin_categories_path) }
      it { expect(response).to have_http_status(:redirect) }
    end
  end
end
