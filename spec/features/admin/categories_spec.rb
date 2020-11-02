RSpec.describe 'admin/categories', type: :feature do
  let!(:category) { create(:category) }
  let(:admin) { create(:admin_user) }
  let(:login_page) { Pages::Admin::LogIn.new }
  let(:categories_page) { Pages::Admin::Categories.new }
  let(:new_category_page) { Pages::Admin::NewCategory.new }

  before do
    login_page.load
    login_page.form.fill_in(admin.email, admin.password)
  end

  describe '#index' do
    before { categories_page.load }

    it { expect(categories_page).to have_content(category.name) }
    it { expect(categories_page.main_content).to have_id_column }
    it { expect(categories_page.main_content).to have_name_column }
  end

  describe '#new' do
    before { new_category_page.load }

    it { expect(new_category_page.fields).to have_name_input }
    it { expect(new_category_page.fields).to have_create_button }
    it { expect(new_category_page.fields).to have_cancel_button }
  end
end
