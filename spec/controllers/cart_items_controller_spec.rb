RSpec.describe CartItemsController, type: :controller do
  let(:book) { create(:book) }
  let(:cart) { create(:cart) }
  let(:quantity) { 2 }

  describe 'POST /cart_items' do
    let(:params) { { cart_item: { quantity: quantity, book_id: book.id, cart_id: cart.id } } }

    before { get :create, params: params }

    it { expect(response).to have_http_status :redirect }
  end

  describe 'DELETE /cart_items' do
    let(:cart_item) { create(:cart_item, cart: cart) }

    before { get :destroy, params: { id: cart_item.id } }

    it { expect(response).to have_http_status :redirect }
  end
end
