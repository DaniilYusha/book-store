RSpec.describe PersistOrderItemService do
  let(:book) { create(:book) }

  describe '#call' do
    context 'when create new order with item' do
      subject(:execute_service) { described_class.new(params: params, order: nil).call }

      let(:params) { attributes_for(:order_item, book_id: book.id) }

      it 'returns true' do
        expect(execute_service).to be(true)
      end

      it 'creates new Order' do
        expect { execute_service }.to change(Order, :count).by(1)
      end

      it 'creates new OrderItem' do
        expect { execute_service }.to change(OrderItem, :count).by(1)
      end
    end

    context 'when update existed order item' do
      subject(:execute_service) { described_class.new(params: params, order: order).call }

      let(:order_item) { create(:order_item, book: book) }
      let(:order) { create(:order, order_items: [order_item]) }
      let(:params) { attributes_for(:order_item, book_id: book.id) }

      it 'returns true' do
        expect(execute_service).to be(true)
      end

      it 'updates order_item quantity' do
        expect { execute_service }.to change { order_item.reload.quantity }.by(params[:quantity])
      end
    end

    context 'with not positive quantity' do
      subject(:execute_service) { described_class.new(params: params, order: nil).call }
      
      let(:params) { attributes_for(:order_item, quantity: 0, book_id: book.id) }

      it 'returns false' do
        expect(execute_service).to be(false)
      end

      it 'does not create new Order' do
        expect { execute_service }.not_to change(Order, :count)
      end

      it 'does not create new OrderItem' do
        expect { execute_service }.not_to change(OrderItem, :count)
      end
    end
  end
end
