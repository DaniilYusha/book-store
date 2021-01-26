RSpec.describe MergeOrdersService do
  describe '#call' do
    let(:order_item) { create(:order_item) }
    let(:guest_order) { create(:order, order_items: [order_item], user: nil) }

    context 'when user order without order' do
      let(:user) { create(:user) }
      let(:expected_count) { 1 }

      it 'returns an Orders collection with only one order' do
        expect(described_class.new(guest_order_id: guest_order.id, user: user).call.count).to eq(expected_count)
      end

      it 'returns array with Order' do
        described_class.new(guest_order_id: guest_order.id, user: user).call.each do |order|
          expect(order.class).to eq(Order)
        end
      end
    end

    context 'when user order has same item' do
      let(:user_order_item) { create(:order_item, book: order_item.book) }
      let(:user_order) { create(:order, order_items: [user_order_item]) }

      it 'returns Order' do
        expect(described_class.new(guest_order_id: guest_order.id, user: user_order.user).call.class).to eq(Order)
      end
    end

    context 'when user order has different item' do
      let(:user_order_item) { create(:order_item) }
      let(:user_order) { create(:order, order_items: [user_order_item]) }

      it 'updates item quantity and returns nil' do
        expect(described_class.new(guest_order_id: guest_order.id, user: user_order.user).call.class).to eq(Order)
      end
    end
  end
end
