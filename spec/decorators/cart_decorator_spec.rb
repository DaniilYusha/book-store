RSpec.describe CartDecorator do
  let(:first_book) { build(:book, price: 5.00) }
  let(:second_book) { build(:book, price: 10.00) }
  let(:first_cart_item) { build(:cart_item, book: first_book, quantity: 2) }
  let(:second_cart_item) { build(:cart_item, book: second_book, quantity: 1) }
  let(:cart) { build(:cart, cart_items: [first_cart_item, second_cart_item]).decorate }

  describe '#items_count' do
    it { expect(cart.items_count).to eq 3 }
  end

  describe '#subtotal_price' do
    it { expect(cart.subtotal_price).to eq 20.00 }
  end

  describe '#coupon_discount' do
    before { build(:coupon, cart: cart, discount: 10.00) }

    it { expect(cart.coupon_discount).to eq 2.00 }
  end

  describe '#order_total' do
    before { build(:coupon, cart: cart, discount: 50.00) }

    it { expect(cart.order_total).to eq 10.00 }
  end
end
