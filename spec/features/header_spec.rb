RSpec.describe 'Header', type: :feature do
  let(:home_page) { Pages::Home.new }

  before { home_page.load }

  it { expect(home_page).to have_current_path(root_path) }
  
  it { expect(home_page.header).to have_brand_name }
  it { expect(home_page.header).to have_home_link }
  it { expect(home_page.header).to have_my_account_link }
  it { expect(home_page.header).to have_shop_link }
  it { expect(home_page.header).to have_log_out_link }
end
