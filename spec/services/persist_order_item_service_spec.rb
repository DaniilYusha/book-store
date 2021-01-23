RSpec.describe PersistOrderItemService do
  let(:book) { create(:book) }

  describe '#call' do
    context 'when create new order with item' do
      let(:order) { create(:order) }
      let(:params) { attributes_for(:order_item, book_id: book.id) }

      it 'returns true' do
        expect(described_class.new(params: params, order: order).call).to eq(true)
      end
    end

    context 'when update existed order item' do
      let(:order_item) { create(:order_item, book: book) }
      let(:order) { create(:order, order_items: [order_item]) }
      let(:params) { attributes_for(:order_item, book_id: book.id) }

      it 'returns true' do
        expect(described_class.new(params: params, order: order).call).to eq(true)
      end
    end
  end
end
