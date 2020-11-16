RSpec.describe CouponsController, type: :controller do
  let(:cart) { create(:cart) }
  let(:coupon) { create(:coupon) }

  describe '#check' do
    let(:params) { { coupon: { code: coupon.code, cart_id: cart.id } } }

    before { get :check, params: params }

    it { expect(response).to have_http_status :redirect }
  end
end
