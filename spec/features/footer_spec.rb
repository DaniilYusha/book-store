RSpec.describe 'Footer', type: :feature do
  let(:home_page) { Pages::Home.new }

  before { home_page.load }

  it 'has current path' do
    expect(home_page).to have_current_path root_path
  end

  it 'has home link' do
    expect(home_page.footer).to have_home_link
  end

  it 'has shop link' do
    expect(home_page.footer).to have_shop_link
  end

  it 'has orders link' do
    expect(home_page.footer).to have_orders_link
  end

  it 'has settings link' do
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

  it 'click shop link' do
    home_page.footer.shop_link.click
    expect(home_page).to have_current_path books_path
  end

  it 'click home link' do
    home_page.footer.click_home_link
    expect(home_page).to be_displayed
  end
end
