RSpec.describe OrdersController, type: :controller do
  let(:order) { create(:order) }

  before { sign_in(order.user) }

  describe '#index' do
    before { get :index }

    it 'returns success http status' do
      expect(response).to have_http_status(:success)
    end
  end

  describe '#show' do
    before { get :show, params: { id: id } }

    context 'with valid id' do
      let(:id) { order.id }

      it 'returns success http status' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid id' do
      let(:id) { 0 }

      it 'returns redirect http status' do
        expect(response).to have_http_status(:redirect)
      end

      it 'set alert flash message' do
        expect(flash.alert).to eq(I18n.t('alert.something_wrong'))
      end
    end
  end
end
