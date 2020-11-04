RSpec.describe 'HomePage', type: :feature do
  let(:home_page) { Pages::Home.new }

  before do
    create_list(:book, PagesController::NEWEST_BOOKS_COUNT)
    visit root_path
  end

  context 'when click get_started link' do
    it 'redirects to catalog page' do
      home_page.get_started.click_get_started_link
      expect(home_page).to have_current_path books_path
    end
  end

  it 'has current path' do
    expect(home_page).to have_current_path root_path
  end

  it 'has page title' do
    expect(home_page.title).to eq I18n.t(:brand)
  end

  it 'has slider' do
    expect(home_page).to have_slider
  end

  it 'has buy_now buttons' do
    expect(home_page.slider).to have_buy_now_buttons(
      count: PagesController::NEWEST_BOOKS_COUNT
    )
  end

  it 'has get_started link' do
    expect(home_page.get_started).to have_get_started_link
  end

  it 'has greeting text' do
    expect(home_page.get_started.greeting.text).to eq I18n.t('home_page.greeting')
  end

  it 'has introduction text' do
    expect(home_page.get_started.introduction.text).to eq I18n.t('home_page.introduction')
  end
end
