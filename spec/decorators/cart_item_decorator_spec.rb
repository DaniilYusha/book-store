RSpec.describe CartItemDecorator do
  let(:book) { build(:book, price: 5.00) }
  let(:cart_item) { build(:cart_item, book: book, quantity: 2).decorate }

  describe '#subtotal_price' do
    it { expect(cart_item.subtotal_price).to eq 10.00 }
  end
end
