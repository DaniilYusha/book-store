RSpec.describe 'Header', type: :feature do
  let(:home_page) { Pages::Home.new }

  before { home_page.load }

  context 'with header partial' do
    it { expect(home_page).to have_current_path(root_path) }

    it { expect(home_page.header).to have_brand_name }
    it { expect(home_page.header).to have_home_link }
    it { expect(home_page.header).to have_shop_link }
    it { expect(home_page.header).to have_log_in_link }
    it { expect(home_page.header).to have_sign_up_link }

    context 'when user signed in' do
      let(:user) { create(:user) }
      let(:sign_in_page) { Pages::SignIn.new }

      before do
        sign_in_page.load
        sign_in_page.sign_in_form.authenticate_user user.email, user.password
      end

      it { expect(home_page.header).to have_my_account_link }
      it { expect(home_page.header).to have_log_out_link }
    end
  end
end
