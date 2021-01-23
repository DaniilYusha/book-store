RSpec.describe OrderItemsController, type: :controller do
  let(:book) { create(:book) }

  describe 'POST /order_items' do
    before { post :create, params: { order_item: params } }

    context 'when create new order item' do
      let(:params) { attributes_for(:order_item, book_id: book.id) }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:notice]).to eq(I18n.t('notice.book.added_to_order')) }
      it { expect(cookies[:order_id].nil?).to be false }
    end

    context 'when update existing order item' do
      let(:order) { create(:order) }
      let(:params) { attributes_for(:order_item, order_id: order.id, book_id: book.id) }
      let(:order_item) { create(:order_item, order_id: order.id, book_id: book.id) }

      before { cookies[:order_id] = order.id }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:notice]).to eq(I18n.t('notice.book.added_to_order')) }
      it { expect(cookies[:order_id]).to eq(order.id) }
    end
  end

  describe 'PATCH /order_item/{id}' do
    let(:order) { create(:order) }

    before do
      cookies[:order_id] = order.id
      patch :update, params: { id: order_item.id, order_item: params }
    end

    context 'when receive failed response' do
      let(:order_item) { create(:order_item, order: order) }
      let(:params) { { decrement: true } }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:alert]).to eq(I18n.t('alert.wrong_quantity')) }
      it { expect(cookies[:order_id].to_i).to eq(order.id) }
    end

    context 'when increment item quantity' do
      let(:order_item) { create(:order_item, order: order) }
      let(:params) { { increment: true } }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:notice]).to eq(I18n.t('notice.book.count_changed')) }
      it { expect(cookies[:order_id].to_i).to eq(order.id) }
    end

    context 'when decrement item quantity' do
      let(:order_item) { create(:order_item, quantity: 2, order: order) }
      let(:params) { { decrement: true } }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:notice]).to eq(I18n.t('notice.book.count_changed')) }
      it { expect(cookies[:order_id].to_i).to eq(order.id) }
    end
  end

  describe 'DELETE /order_item/{id}' do
    let(:order) { create(:order) }
    let(:order_item) { create(:order_item, order_id: order.id) }

    before do
      cookies[:order_id] = order.id
      delete :destroy, params: { id: id }
    end

    context 'when successfully destroy order item' do
      let(:id) { order_item.id }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:notice]).to eq(I18n.t('notice.book.deleted')) }
      it { expect(cookies[:order_id].to_i).to eq(order.id) }
    end

    context 'when receive failed response' do
      let(:id) { order_item.id.next }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:alert]).to eq(I18n.t('alert.something_wrong')) }
      it { expect(cookies[:order_id].to_i).to eq(order.id) }
    end
  end
end
