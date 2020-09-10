RSpec.describe 'HomeIndex', type: :feature do
  describe 'home/index' do
    before { visit '/' }

    context 'when user see header' do
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

    context 'when user see main content' do
      it 'has slider' do
        expect(page).to have_css '#slider'
      end

      it 'has `Buy now` button' do
        expect(page).to have_button I18n.t('buttons.buy_now')
      end

      it 'has greeting text' do
        expect(page).to have_content I18n.t('home_page.greeting')
      end

      it 'has introduction text' do
        expect(page).to have_content I18n.t('home_page.introduction')
      end

      it 'has `Get started` button' do
        expect(page).to have_button I18n.t('buttons.get_started')
      end
    end

    context 'when user see footer' do
      it 'has `Orders` link' do
        expect(page).to have_link I18n.t('links.orders')
      end

      it 'has `Settings` link' do
        expect(page).to have_link I18n.t('links.settings')
      end

      it 'has email' do
        expect(page).to have_css 'p.general-nav-mail'
      end

      it 'has phone number' do
        expect(page).to have_css 'p.general-nav-number'
      end
    end
  end
end
