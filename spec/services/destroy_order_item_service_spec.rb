RSpec.describe DestroyOrderItemService do
  describe '#call' do
    context 'when order has one item' do
      subject(:execute_service) { described_class.new(item_id: order_item.id, order: order_item.order).call }

      let(:order_item) { create(:order_item) }

      it 'returns Order instance' do
        expect(execute_service.class).to eq(Order)
      end

      it 'destroy order' do
        expect(execute_service.destroyed?).to be(true)
      end
    end

    context 'when order has more than one item' do
      subject(:execute_service) { described_class.new(item_id: order.order_items.first.id, order: order).call }

      let(:order_items) { create_list(:order_item, 2) }
      let(:order) { create(:order, order_items: order_items) }

      it 'returns OrderItem instance' do
        expect(execute_service.class).to eq(OrderItem)
      end

      it 'destroy order item' do
        expect(execute_service.destroyed?).to be(true)
      end

      it 'change order_items count' do
        expect { execute_service }.to change { OrderItem.count }.by(1)
      end
    end

    context 'with invalid params' do
      subject(:execute_service) { described_class.new(item_id: order.id, order: order).call }

      let(:order) { create(:order) }

      it 'raise ActiveRecord::RecordNotFound error' do
        expect { execute_service.class }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
