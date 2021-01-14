RSpec.describe 'CartsPage', type: :feature do
  let(:book) { create(:book) }
  let(:cart_item) { create(:cart_item, book_id: book.id).decorate }
  let(:cart) { create(:cart, cart_items: [cart_item]).decorate }
  let(:user) { create(:user, cart: cart) }

  before { login_as(user, scope: :user) }

  describe 'index page' do
    let(:cart_page) { Pages::Cart.new }

    before { cart_page.load }

    context 'with page elements' do
      it { expect(cart_page.orders).to have_book_title }
      it { expect(cart_page.orders).to have_book_price }
      it { expect(cart_page.orders).to have_quantity_input }
      it { expect(cart_page.orders).to have_minus_link }
      it { expect(cart_page.orders).to have_plus_link }
      it { expect(cart_page.orders).to have_sub_total_price }
      it { expect(cart_page.orders).to have_remove_items_link }

      it { expect(cart_page.orders).to have_content(book.title) }
      it { expect(cart_page.orders).to have_content(book.price) }
      it { expect(cart_page.orders).to have_content(cart_item.subtotal_price) }
      it { expect(cart_page.orders.quantity_input.value).to have_content(cart_item.quantity) }

      it { expect(cart_page.order_summary).to have_coupon_code_field }
      it { expect(cart_page.order_summary).to have_apply_coupon_button }
      it { expect(cart_page.order_summary).to have_summary_block }

      it { expect(cart_page.order_summary.summary_block).to have_content(cart_item.subtotal_price) }
      it { expect(cart_page.order_summary.summary_block).to have_content(cart.order_total) }
    end

    context 'when click plus icon' do
      before { cart_page.orders.plus_link.click }

      it { expect(cart_page).to have_content(I18n.t('notice.book.count_changed')) }
    end

    context 'when click minus icon' do
      before { cart_page.orders.minus_link.click }

      it { expect(cart_page).to have_content(I18n.t('notice.book.count_changed')) }
    end

    context 'when click remove item link' do
      before { cart_page.orders.remove_items_link.click }

      it { expect(cart_page).not_to have_orders }
      it { expect(cart_page).not_to have_order_summary }
    end
  end
end
