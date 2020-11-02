RSpec.describe 'admin/categories', type: :feature do
  let!(:author) { create(:author) }
  let(:admin) { create(:admin_user) }
  let(:login_page) { Pages::Admin::LogIn.new }
  let(:authors_page) { Pages::Admin::Authors.new }
  let(:new_author_page) { Pages::Admin::NewAuthor.new }

  before do
    login_page.load
    login_page.form.fill_in(admin.email, admin.password)
  end

  describe '#index' do
    before { authors_page.load }

    it { expect(authors_page.main_content).to have_first_name_column }
    it { expect(authors_page.main_content).to have_last_name_column }
    it { expect(authors_page).to have_content(author.first_name) }
    it { expect(authors_page).to have_content(author.last_name) }
  end

  describe '#new' do
    before { new_author_page.load }

    it { expect(new_author_page.fields).to have_first_name_input }
    it { expect(new_author_page.fields).to have_last_name_input }
    it { expect(new_author_page.fields).to have_create_button }
    it { expect(new_author_page.fields).to have_cancel_button }
  end
end
