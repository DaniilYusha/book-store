RSpec.describe 'Footer', type: :feature do
  describe 'footer layout' do
    before { visit root_path }

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
