RSpec.describe 'CartsPage', type: :feature do
  let(:cart) { create(:cart, cart_items: [create(:cart_item)]) }
  let(:user) { create(:user, cart: cart) }
  let(:login_page) { Pages::SignIn.new }
  let(:cart_page) { Pages::Cart.new }

  before do
    login_page.load
    login_page.sign_in_form.authenticate_user(user.email, user.password)
    cart_page.load(id: cart.id)
  end

  it { expect(cart_page.orders).to have_books_titles(count: 1) }
  it { expect(cart_page.orders).to have_books_price(count: 1) }
  it { expect(cart_page.orders).to have_quantity_inputs(count: 1) }
  it { expect(cart_page.orders).to have_minus_links(count: 1) }
  it { expect(cart_page.orders).to have_plus_links(count: 1) }
  it { expect(cart_page.orders).to have_sub_total_price(count: 1) }
  it { expect(cart_page.orders).to have_remove_items_links(count: 1) }

  it { expect(cart_page.order_summary).to have_coupon_code_field }
  it { expect(cart_page.order_summary).to have_apply_coupon_button }
  it { expect(cart_page.order_summary).to have_summary_block }

  context 'when click remove item link' do
    before { cart_page.orders.remove_items_links.first.click }

    it { expect(cart_page).not_to have_orders }
    it { expect(cart_page).not_to have_order_summary }
  end
end
