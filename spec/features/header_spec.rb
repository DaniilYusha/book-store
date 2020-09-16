RSpec.describe 'Header', type: :feature do
  describe 'header layout' do
    before { visit root_path }

    it 'has current path' do
      expect(page).to have_current_path root_path
    end

    it 'has brand name' do
      expect(page).to have_content I18n.t(:brand)
    end

    it 'has `Home` link' do
      expect(page).to have_link I18n.t('links.home')
    end

    it 'has `Shop` link' do
      expect(page).to have_link I18n.t('links.shop')
    end

    it 'has `My account` link' do
      expect(page).to have_link I18n.t('links.my_account')
    end

    it 'has `Mobile development` link' do
      expect(page).to have_link I18n.t('links.mobile_development')
    end

    it 'has `Photo` link' do
      expect(page).to have_link I18n.t('links.photo')
    end

    it 'has `Web design` link' do
      expect(page).to have_link I18n.t('links.web_design')
    end

    it 'has `Log out` link' do
      expect(page).to have_link I18n.t('links.log_out')
    end
  end
end
