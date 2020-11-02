RSpec.describe 'admin/admin_users', type: :feature do
  let(:admin) { create(:admin_user) }
  let(:login_page) { Pages::Admin::LogIn.new }
  let(:admins_page) { Pages::Admin::AdminUsers.new }
  let(:admin_page) { Pages::Admin::AdminUser.new }
  let(:new_admin_page) { Pages::Admin::NewAdminUser.new }

  before do
    login_page.load
    login_page.form.fill_in(admin.email, admin.password)
  end

  describe '#index' do
    before { admins_page.load }

    it { expect(admins_page.main_content).to have_id_column }
    it { expect(admins_page.main_content).to have_name_column }
    it { expect(admins_page).to have_content(admin.email) }
  end

  describe '#new' do
    before { new_admin_page.load }

    it { expect(new_admin_page.fields).to have_email_input }
    it { expect(new_admin_page.fields).to have_password_input }
    it { expect(new_admin_page.fields).to have_password_confirmation_input }
    it { expect(new_admin_page.fields).to have_create_button }
    it { expect(new_admin_page.fields).to have_cancel_button }
  end

  describe '#show' do
    before { admin_page.load(id: admin.id) }

    it { expect(admin_page.admin_details).to have_header }
    it { expect(admin_page.admin_details).to have_email_row }
    it { expect(admin_page.admin_details).to have_reset_password_token_list_row }
    it { expect(admin_page.admin_details).to have_reset_password_sent_at_row }
    it { expect(admin_page.admin_details).to have_remember_created_at_row }
    it { expect(admin_page.admin_details).to have_created_at_row }
    it { expect(admin_page.admin_details).to have_updated_at_row }
  end
end
