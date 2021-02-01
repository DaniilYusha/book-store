RSpec.describe MergeOrdersService do
  describe '#call' do
    let(:order_item) { create(:order_item) }
    let(:guest_order) { create(:order, order_items: [order_item], user: nil) }

    context 'when user order without order' do
      subject(:execute_service) { described_class.new(guest_order_id: guest_order.id, user: user).call }

      let(:user) { create(:user) }
      let(:expected_count) { 1 }

      it 'returns an Orders collection with only one order' do
        expect(execute_service.count).to eq(expected_count)
      end

      it 'returns guest order' do
        expect(execute_service.first.id).to eq(guest_order.id)
      end

      it 'set user_id to guest order' do
        expect(execute_service.first.user_id).to eq(user.id)
      end

      it 'returned order has same order items count as guest order' do
        expect(execute_service.first.order_items.count).to eq(guest_order.order_items.count)
      end

      it 'returned order has same items as guest order' do
        execute_service.first.order_items.each do |user_order_item|
          expect(guest_order.order_items.exists?(book_id: user_order_item.book_id)).to be(true)
        end
      end
    end

    context 'when user order has same item' do
      subject(:execute_service) { described_class.new(guest_order_id: guest_order.id, user: user_order.user).call }

      let(:user_order_item) { create(:order_item, book: order_item.book) }
      let(:user_order) { create(:order, order_items: [user_order_item]) }

      it 'returns Order instance' do
        expect(execute_service.class).to eq(Order)
      end

      it 'returns guest order' do
        expect(execute_service.id).to eq(guest_order.id)
      end

      it 'returns destroyed guest order' do
        expect(execute_service.destroyed?).to be(true)
      end

      it 'guest order has no order_items' do
        expect(execute_service.order_items.empty?).to be(true)
      end

      it 'change order item quantity' do
        order = Order.find_by(id: user_order.id)
        expect { execute_service }.to change { order.order_items.first.quantity }
          .by(guest_order.order_items.first.quantity)
      end
    end

    context 'when user order has different item' do
      subject(:execute_service) { described_class.new(guest_order_id: guest_order.id, user: user_order.user).call }

      let(:user_order_item) { create(:order_item) }
      let(:user_order) { create(:order, order_items: [user_order_item]) }

      it 'returns Order instance' do
        expect(execute_service.class).to eq(Order)
      end

      it 'returns guest order' do
        expect(execute_service.id).to eq(guest_order.id)
      end

      it 'returns destroyed guest order' do
        expect(execute_service.destroyed?).to be(true)
      end

      it 'guest order has no order_items' do
        expect(execute_service.order_items.empty?).to be(true)
      end

      it 'changes user order items count' do
        order = Order.find_by(id: user_order.id)
        expect { execute_service }.to change { order.order_items.count }.by(guest_order.order_items.count)
      end
    end
  end
end
