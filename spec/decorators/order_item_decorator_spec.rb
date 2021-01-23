RSpec.describe OrderItemDecorator do
  let(:order_item) { build(:order_item).decorate }

  describe '#subtotal_price' do
    let(:result) { order_item.quantity * order_item.book.price }

    it { expect(order_item.subtotal_price).to eq(result) }
  end
end
