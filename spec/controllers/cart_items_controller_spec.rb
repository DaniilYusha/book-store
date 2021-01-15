RSpec.describe CartItemsController, type: :controller do
  let(:book) { create(:book) }

  describe 'POST /cart_items' do
    before { post :create, params: { cart_item: params } }

    context 'when create new cart item' do
      let(:params) { attributes_for(:cart_item, book_id: book.id) }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:notice]).to eq(I18n.t('notice.book.added_to_cart')) }
      it { expect(cookies[:cart_id].nil?).to be false }
    end

    context 'when update existing cart item' do
      let(:cart) { create(:cart) }
      let(:params) { attributes_for(:cart_item, cart_id: cart.id, book_id: book.id) }
      let(:cart_item) { create(:cart_item, cart_id: cart.id, book_id: book.id) }

      before { cookies[:cart_id] = cart.id }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:notice]).to eq(I18n.t('notice.book.added_to_cart')) }
      it { expect(cookies[:cart_id]).to eq(cart.id) }
    end
  end

  describe 'PATCH /cart_item/{id}' do
    let(:cart) { create(:cart) }
    let(:cart_item) { create(:cart_item) }
    let(:params) { attributes_for(:cart_item, cart_id: cart.id) }

    before do
      cookies[:cart_id] = cart.id
      patch :update, params: { id: cart_item.id, cart_item: params }
    end

    it { expect(response).to have_http_status(:redirect) }
    it { expect(flash[:notice]).to eq(I18n.t('notice.book.count_changed')) }
    it { expect(cookies[:cart_id].to_i).to eq(cart.id) }
  end

  describe 'DELETE /cart_item/{id}' do
    let(:cart) { create(:cart) }
    let(:cart_item) { create(:cart_item, cart_id: cart.id) }

    before do
      cookies[:cart_id] = cart.id
      delete :destroy, params: { id: cart_item.id }
    end

    it { expect(response).to have_http_status(:redirect) }
    it { expect(flash[:notice]).to eq(I18n.t('notice.book.deleted')) }
    it { expect(cookies[:cart_id].to_i).to eq(cart.id) }
  end
end
