RSpec.describe 'Footer', type: :feature do
  let(:home_page) { Home.new }

  before { home_page.load }

  it 'has current path' do
    expect(home_page).to have_current_path root_path
  end

  it "has `#{I18n.t 'links.home'}` link" do
    expect(home_page.footer).to have_home_link
  end

  it "has `#{I18n.t 'links.shop'}` link" do
    expect(home_page.footer).to have_shop_link
  end

  it "has `#{I18n.t 'links.orders'}` link" do
    expect(home_page.footer).to have_orders_link
  end

  it "has `#{I18n.t 'links.settings'}` link" do
    expect(home_page.footer).to have_settings_link
  end

  it 'has email' do
    expect(home_page.footer).to have_email
  end

  it 'has phone number' do
    expect(home_page.footer).to have_phone
  end

  it 'has facebook link' do
    expect(home_page.footer).to have_facebook_link
  end

  it "click `#{I18n.t 'links.home'}` link" do
    home_page.footer.home_link.click
    expect(home_page).to be_displayed
  end
end
