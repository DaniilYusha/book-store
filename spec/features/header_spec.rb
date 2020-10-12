RSpec.describe 'Header', type: :feature do
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

  it 'has log_in link' do
    expect(home_page.header).to have_log_in_link
  end

  it 'has sign_up link' do
    expect(home_page.header).to have_sign_up_link
  end

  it 'click home link' do
    home_page.header.click_home_link
    expect(home_page).to be_displayed
  end

  context 'when user signed in' do
    let(:user) { create(:user) }
    let(:sign_in_page) { Pages::SignIn.new }

    before do
      visit new_user_session_path
      sign_in_page.sign_in_form.authenticate_user user.email, user.password
    end

    it 'has my_account link' do
      expect(home_page.header).to have_my_account_link
    end

    it 'has log_out link' do
      expect(home_page.header).to have_log_out_link
    end
  end
end
