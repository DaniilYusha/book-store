RSpec.describe MergeOrdersService do
  let(:user) { create(:user) }
  let(:order_item) { create(:order_item, quantity: 2) }
  let(:order) { create(:order, order_items: [order_item]) }

  describe '#call' do
    context 'when user order without items' do
      let(:user_order) { create(:order, user: user) }

      it 'create new order for user and returns an Array' do
        expect(described_class.new(order: order, user_order: user_order).call.class).to eq(Array)
      end

      it 'returns array with OrderItems' do
        described_class.new(order: order, user_order: user_order).call.each do |item|
          expect(item.class).to eq(OrderItem)
        end
      end
    end

    context 'when user order has same item with different quantity' do
      let(:user_order_item) { create(:order_item, book: order_item.book) }
      let(:user_order) { create(:order, user: user, order_items: [user_order_item]) }

      it 'updates item quantity and returns nil' do
        expect(described_class.new(order: order, user_order: user_order).call).to eq(nil)
      end
    end
  end
end
