RSpec.describe DestroyOrderItemService do
  let(:order_item) { create(:order_item) }

  describe '#call' do
    it { expect(described_class.new(item_id: order_item.id, order: order_item.order).call).to eq(true) }
  end
end
