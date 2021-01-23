RSpec.describe UpdateOrderItemService do
  let(:order_item) { create(:order_item, quantity: 2) }

  describe '#call' do
    context 'when increment item quantity' do
      let(:params) { { increment: true } }

      it { expect(described_class.new(id: order_item.id, params: params).call).to eq(true) }
    end

    context 'when decrement item quantity' do
      let(:params) { { decrement: true } }

      it { expect(described_class.new(id: order_item.id, params: params).call).to eq(true) }
    end

    context  'with invalid params' do
      let(:params) { { increment: true } }

      it { expect(described_class.new(id: order_item.id.next, params: params).call).to eq(false) }
    end
  end
end
