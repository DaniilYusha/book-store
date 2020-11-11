RSpec.describe 'Footer', type: :feature do
  let(:home_page) { Pages::Home.new }

  before { home_page.load }

  it { expect(home_page).to have_current_path root_path }

  it { expect(home_page.footer).to have_home_link }
  it { expect(home_page.footer).to have_shop_link }
  it { expect(home_page.footer).to have_email }
  it { expect(home_page.footer).to have_phone }
  it { expect(home_page.footer).to have_facebook_link }

  context 'when user signed in' do
    let(:user) { create(:user) }
    let(:sign_in_page) { Pages::SignIn.new }

    before do
      sign_in_page.load
      sign_in_page.sign_in_form.authenticate_user user.email, user.password
    end

    it { expect(home_page.footer).to have_orders_link }
    it { expect(home_page.footer).to have_settings_link }
  end
end
