RSpec.describe DestroyOrderItemService do
  let(:order_item) { create(:order_item) }

  describe '#call' do
    context 'with valid params' do
      it { expect(described_class.new(item_id: order_item.id, order: order_item.order).call).to eq(true) }
    end

    context 'with invalid params' do
      let(:params) { { increment: true } }

      it { expect(described_class.new(item_id: order_item.id.next, order: order_item.order).call).to eq(false) }
    end
  end
end
