RSpec.describe 'Header', type: :feature do
  let(:home_page) { Pages::Home.new }

  # before(:all) {  }

  before do
    create_list(:category, PagesController::LAST_ADDED_BOOKS_COUNT)
    visit root_path
  end

  it 'has current path' do
    expect(home_page).to have_current_path root_path
  end

  it 'has brand name' do
    expect(home_page.header.brand_name).to have_text I18n.t(:brand)
  end

  it "has `#{I18n.t 'links.home'}` link" do
    expect(home_page.header).to have_home_link
  end

  it "has `#{I18n.t 'links.my_account'}` link" do
    expect(home_page.header).to have_my_account_link
  end

  it "has `#{I18n.t 'links.shop'}` link" do
    expect(home_page.header).to have_shop_link
  end

  it 'has categories links' do
    expect(home_page.header).to have_categories_links(
      count: PagesController::LAST_ADDED_BOOKS_COUNT
    )
  end

  it "has `#{I18n.t('links.log_out')}` link" do
    expect(home_page.header).to have_log_out_link
  end

  it "click `#{I18n.t 'links.home'}` link" do
    home_page.header.click_home_link
    expect(home_page).to be_displayed
  end
end
