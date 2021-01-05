RSpec.describe Admin::AuthorsController, type: :controller do
  let(:admin) { create(:admin_user) }

  before { sign_in(admin) }

  describe 'POST create' do
    before { post :create, params: { author: params } }

    context 'with valid params' do
      let(:params) { attributes_for(:author) }

      it { expect(response).to redirect_to(admin_authors_path) }
      it { expect(response).to have_http_status(:found) }
    end
  end

  describe 'PUT update' do
    let(:author) { create(:author) }

    before { put :update, params: { id: author.id, author: params } }

    context 'with valid params' do
      let(:params) { attributes_for(:author) }

      it { expect(response).to redirect_to(admin_authors_path) }
      it { expect(response).to have_http_status(:redirect) }
    end
  end
end
