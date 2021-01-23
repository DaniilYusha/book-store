RSpec.describe CouponsController, type: :controller do
  let(:order) { create(:order) }
  let(:coupon) { create(:coupon) }

  describe '#update' do
    before { patch :update, params: params }

    context 'with valid params' do
      let(:params) { { coupon: { code: coupon.code } } }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:notice]).to eq(I18n.t('notice.coupon.apply')) }
    end

    context 'with invalid params' do
      let(:fake_code) { rand(0..5) }
      let(:params) { { coupon: { code: fake_code } } }
      let(:error) { "Code #{I18n.t('alert.coupon.not_exist')}" }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:alert]).to eq(error) }
    end
  end
end
