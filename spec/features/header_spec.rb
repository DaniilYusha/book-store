RSpec.describe 'Header', type: :feature do
  let(:categories) { create_list(:category, PagesController::LAST_BOOKS_COUNT) }
  let(:home_page) { Pages::Home.new }

  before { visit root_path }

  it 'has current path' do
    expect(home_page).to have_current_path root_path
  end

  it 'has brand name' do
    expect(home_page.header.brand_name).to have_text I18n.t(:brand)
  end

  it 'has home link' do
    expect(home_page.header).to have_home_link
  end

  it 'has my_account link' do
    expect(home_page.header).to have_my_account_link
  end

  it 'has shop link' do
    expect(home_page.header).to have_shop_link
  end

  it 'has categories links' do
    expect(home_page.header).to have_categories_links
  end

  it 'has log_out link' do
    expect(home_page.header).to have_log_out_link
  end

  it 'click home link' do
    home_page.header.click_home_link
    expect(home_page).to be_displayed
  end
end
