RSpec.describe 'Footer', type: :feature do
  let(:home_page) { Pages::Home.new }

  before { home_page.load }

  it { expect(home_page).to have_current_path(root_path) }
  
  it { expect(home_page.footer).to have_home_link }
  it { expect(home_page.footer).to have_shop_link }
  it { expect(home_page.footer).to have_orders_link }
  it { expect(home_page.footer).to have_settings_link }
  it { expect(home_page.footer).to have_email }
  it { expect(home_page.footer).to have_phone }
  it { expect(home_page.footer).to have_facebook_link }
end
