RSpec.describe 'HomePage', type: :feature do
  let(:home_page) { Pages::Home.new }

  before { home_page.load }

  it 'has current path' do
    expect(home_page).to have_current_path root_path
  end

  it "has #{I18n.t :brand} title" do
    expect(home_page.title).to eq I18n.t(:brand)
  end

  it 'has slider' do
    expect(home_page).to have_slider
  end

  it "has `#{I18n.t 'buttons.buy_now'}` buttons" do
    expect(home_page.slider).to have_buy_now_buttons(count: 3)
  end

  it "has `#{I18n.t 'buttons.get_started'}` link" do
    expect(home_page.get_started).to have_get_started_link
  end

  it 'has greeting text' do
    expect(home_page.get_started.greeting.text).to eq I18n.t('home_page.greeting')
  end

  it 'has introduction text' do
    expect(home_page.get_started.introduction.text).to eq I18n.t('home_page.introduction')
  end
end
