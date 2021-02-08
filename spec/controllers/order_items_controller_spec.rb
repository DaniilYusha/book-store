RSpec.describe OrderItemsController, type: :controller do
  let(:order) { create(:order) }
  let(:book) { create(:book) }

  describe 'POST /order_items' do
    before { post :create, params: { order_item: params } }

    context 'when create new order item' do
      let(:params) { attributes_for(:order_item, book_id: book.id) }

      it 'has redirect http status' do
        expect(response).to have_http_status(:redirect)
      end

      it 'has notice flash' do
        expect(flash[:notice]).to eq(I18n.t('notice.book.added_to_order'))
      end

      it 'has no order_id in cookies' do
        expect(cookies[:order_id]).not_to be_nil
      end
    end

    context 'when update existing order item' do
      let(:params) { attributes_for(:order_item, order_id: order.id, book_id: book.id) }
      let(:order_item) { create(:order_item, order_id: order.id, book_id: book.id) }

      before { cookies[:order_id] = order.id }

      it 'has redirect http status' do
        expect(response).to have_http_status(:redirect)
      end

      it 'has notice flash' do
        expect(flash[:notice]).to eq(I18n.t('notice.book.added_to_order'))
      end

      it 'has order_id in cookies' do
        expect(cookies[:order_id]).to eq(order.id)
      end
    end
  end

  describe 'PATCH /order_item/{id}' do
    let(:order_item) { create(:order_item, order: order) }

    before do
      cookies[:order_id] = order.id
      patch :update, params: { id: order_item.id, order_item: params }
    end

    context 'with invalid quantity' do
      let(:params) { { quantity: -5, book_id: order_item.book.id } }
      let(:error_message) { "Quantity must be greater than #{OrderItemForm::INVALID_QUANTITY}" }

      it 'has redirect http status' do
        expect(response).to have_http_status(:redirect)
      end

      it 'has alert flash' do
        expect(flash[:alert]).to eq(error_message)
      end

      it 'has order_id in cookies' do
        expect(cookies[:order_id].to_i).to eq(order.id)
      end
    end

    context 'with valid quantity' do
      let(:params) { attributes_for(:order_item, book_id: order_item.book.id) }

      it 'has redirect http status' do
        expect(response).to have_http_status(:redirect)
      end

      it 'has notice flash' do
        expect(flash[:notice]).to eq(I18n.t('notice.book.count_changed'))
      end

      it 'has order_id in cookies' do
        expect(cookies[:order_id].to_i).to eq(order.id)
      end
    end
  end

  describe 'DELETE /order_item/{id}' do
    before do
      cookies[:order_id] = order.id
      delete :destroy, params: { id: id }
    end

    context 'when successfully destroy order item' do
      let(:order_item) { create(:order_item, order_id: order.id) }
      let(:id) { order_item.id }

      it 'has redirect http status' do
        expect(response).to have_http_status(:redirect)
      end

      it 'has notice flash' do
        expect(flash[:notice]).to eq(I18n.t('notice.book.deleted'))
      end

      it 'has order_id in cookies' do
        expect(cookies[:order_id].to_i).to eq(order.id)
      end
    end

    context 'when receive failed response' do
      let(:order_items) { create_list(:order_item, 2, order_id: order.id) }
      let(:id) { order.id }

      it 'has redirect http status' do
        expect(response).to have_http_status(:redirect)
      end

      it 'has alert flash' do
        expect(flash[:alert]).to eq(I18n.t('alert.something_wrong'))
      end

      it 'has order_id in cookies' do
        expect(cookies[:order_id].to_i).to eq(order.id)
      end
    end
  end
end
