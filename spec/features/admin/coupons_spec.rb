RSpec.describe 'admin/coupons', type: :feature do
  let(:admin) { create(:admin_user) }
  let_it_be(:coupon) { create(:coupon) }

  before { login_as(admin) }

  describe '/index' do
    let(:coupons_page) { Pages::Admin::Coupons.new }

    before { coupons_page.load }

    context 'with page elements' do
      it { expect(coupons_page.main_content).to have_id_column }
      it { expect(coupons_page.main_content).to have_code_column }
      it { expect(coupons_page.main_content).to have_discount_column }

      it { expect(coupons_page.main_content).to have_content(coupon.id) }
      it { expect(coupons_page.main_content).to have_content(coupon.code) }
      it { expect(coupons_page.main_content).to have_content(coupon.discount) }
    end
  end

  describe '/new' do
    let(:new_coupon_page) { Pages::Admin::NewCoupon.new }

    before { new_coupon_page.load }

    context 'with page elements' do
      it { expect(new_coupon_page.fields).to have_code_input }
      it { expect(new_coupon_page.fields).to have_discount_input }
      it { expect(new_coupon_page.fields).to have_create_button }
      it { expect(new_coupon_page.fields).to have_cancel_button }
    end

    context 'when fill in form with valid params' do
      let(:coupon_params) { attributes_for(:coupon) }

      before { new_coupon_page.fields.submit(coupon_params) }

      it { expect(new_coupon_page.text).to have_content(coupon_params[:code]) }
      it { expect(new_coupon_page.text).to have_content(coupon_params[:discount]) }
      it { expect(new_coupon_page.text).to have_content(I18n.t('notice.coupon.created')) }
    end
  end

  describe '/edit' do
    let(:edit_coupon_page) { Pages::Admin::EditCoupon.new }

    before { edit_coupon_page.load(id: coupon.id) }

    context 'with page elements' do
      it { expect(edit_coupon_page.fields).to have_code_input }
      it { expect(edit_coupon_page.fields).to have_discount_input }
      it { expect(edit_coupon_page.fields.code_input.value).to have_content(coupon.code) }
      it { expect(edit_coupon_page.fields.discount_input.value).to have_content(coupon.discount) }
      it { expect(edit_coupon_page.fields).to have_create_button }
      it { expect(edit_coupon_page.fields).to have_cancel_button }
    end

    context 'when fill in form with valid params' do
      let(:coupon_params) { attributes_for(:coupon) }

      before { edit_coupon_page.fields.submit(coupon_params) }

      it { expect(edit_coupon_page.text).to have_content(coupon_params[:code]) }
      it { expect(edit_coupon_page.text).to have_content(coupon_params[:discount]) }
      it { expect(edit_coupon_page.text).to have_content(I18n.t('notice.coupon.updated')) }
    end
  end
end
