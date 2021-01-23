RSpec.describe 'Orders', type: :feature do
  let_it_be(:book) { create(:book).decorate }
  let(:user) { create(:user) }
  let(:home_page) { Pages::Home.new }

  before do
    login_as(user, scope: :user)
    home_page.load
    home_page.slider.buy_first_book
  end

  describe 'index page' do
    let(:cart_page) { Pages::Orders::Index.new }

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

      it { expect(cart_page.order_summary).to have_coupon_code_field }
      it { expect(cart_page.order_summary).to have_apply_coupon_button }
      it { expect(cart_page.order_summary).to have_summary_block }
    end

    context 'when click plus icon' do
      before { cart_page.orders.plus_link.click }

      it { expect(cart_page).to have_content(I18n.t('notice.book.count_changed')) }
    end

    context 'when click minus icon with one book' do
      before { cart_page.orders.minus_link.click }

      it { expect(cart_page).to have_content(I18n.t('alert.something_wrong')) }
    end

    context 'when click remove item link' do
      before { cart_page.orders.remove_items_link.click }

      it { expect(cart_page).not_to have_orders }
      it { expect(cart_page).not_to have_order_summary }
    end
  end
end
