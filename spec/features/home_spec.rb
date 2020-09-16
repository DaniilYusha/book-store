RSpec.describe 'HomePage', type: :feature do
  describe 'home' do
    before { visit root_path }

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
end
