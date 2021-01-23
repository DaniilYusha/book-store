RSpec.describe OrderDecorator do
  let(:first_item) { build(:order_item) }
  let(:second_item) { build(:order_item) }
  let(:order) { build(:order, order_items: [first_item, second_item]).decorate }

  describe '#items_count' do
    let(:result) { first_item.quantity + second_item.quantity }

    it { expect(order.items_count).to eq(result) }
  end

  describe '#subtotal_price' do
    let(:result) { second_item.book.price * second_item.quantity + first_item.book.price * first_item.quantity }

    it { expect(order.subtotal_price).to eq(result) }
  end

  describe '#coupon_discount' do
    context 'when order without coupon' do
      it { expect(order.coupon_discount).to eq(OrderDecorator::DEFAULT_DISCOUNT) }
    end

    context 'when order with coupon' do
      let(:coupon) { build(:coupon, order: order) }
      let(:result) { (coupon.order.subtotal_price * coupon.discount / OrderDecorator::DIVIDER).floor(2) }

      it { expect(coupon.order.coupon_discount).to eq(result) }
    end
  end

  describe '#order_total' do
    let(:result) { order.subtotal_price - order.coupon_discount }

    it { expect(order.order_total).to eq(result) }
  end
end
