RSpec.describe CartItemsController, type: :controller do
  let(:book) { create(:book) }
  let(:cart) { create(:cart) }

  describe 'POST /cart_items' do
    let(:params) { attributes_for(:cart_item, cart_id: cart.id, book_id: book.id) }

    before { post :create, params: { cart_item: params } }

    it { expect(response).to have_http_status(:redirect) }
    it { expect(flash[:notice]).to eq(I18n.t('notice.book.added_to_cart')) }
  end

  describe 'PATCH /cart_item/{id}' do
    let(:cart_item) { create(:cart_item) }
    let(:params) { attributes_for(:cart_item) }

    before { patch :update, params: { id: cart_item.id, cart_item: params } }

    it { expect(response).to have_http_status(:redirect) }
    it { expect(flash[:notice]).to eq(I18n.t('notice.book.count_changed')) }
  end

  describe 'DELETE /cart_item/{id}' do
    let(:cart_item) { create(:cart_item) }

    before { delete :destroy, params: { id: cart_item.id } }

    it { expect(response).to have_http_status(:redirect) }
    it { expect(flash[:notice]).to eq(I18n.t('notice.book.deleted')) }
  end
end
