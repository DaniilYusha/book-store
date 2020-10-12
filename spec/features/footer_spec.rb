RSpec.describe 'Footer', type: :feature do
  let(:home_page) { Pages::Home.new }

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

  it 'has email' do
    expect(home_page.footer).to have_email
  end

  it 'has phone number' do
    expect(home_page.footer).to have_phone
  end

  it 'has facebook link' do
    expect(home_page.footer).to have_facebook_link
  end

  it "click #{I18n.t 'links.shop'} link" do
    home_page.footer.shop_link.click
    expect(home_page).to have_current_path books_path
  end

  it "click `#{I18n.t 'links.home'}` link" do
    home_page.footer.click_home_link
    expect(home_page).to be_displayed
  end

  context 'when user signed in' do
    let(:user) { create(:user) }
    let(:sign_in_page) { Pages::SignIn.new }

    before do
      visit new_user_session_path
      sign_in_page.sign_in_form.authenticate_user user.email, user.password
    end

    it "has `#{I18n.t 'links.orders'}` link" do
      expect(home_page.footer).to have_orders_link
    end

    it "has `#{I18n.t 'links.settings'}` link" do
      expect(home_page.footer).to have_settings_link
    end
  end
end
