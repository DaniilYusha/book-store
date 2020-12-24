RSpec.describe 'admin/admin_users', type: :feature do
  let(:admin) { create(:admin_user) }
  let(:login_page) { Pages::Admin::LogIn.new }

  before do
    login_page.load
    login_page.form.fill_in(admin.email, admin.password)
  end

  describe '/index' do
    let(:admins_page) { Pages::Admin::AdminUsers.new }

    before { admins_page.load }

    it { expect(admins_page.main_content).to have_id_column }
    it { expect(admins_page.main_content).to have_name_column }

    it { expect(admins_page.main_content).to have_content(admin.id) }
    it { expect(admins_page.main_content).to have_content(admin.email) }
  end

  describe '/new' do
    let(:new_admin_page) { Pages::Admin::NewAdminUser.new }

    before { new_admin_page.load }

    context 'with page elements' do
      it { expect(new_admin_page.fields).to have_email_row }
      it { expect(new_admin_page.fields).to have_password_row }
      it { expect(new_admin_page.fields).to have_password_confirmation_row }
      it { expect(new_admin_page.fields).to have_email_input }
      it { expect(new_admin_page.fields).to have_password_input }
      it { expect(new_admin_page.fields).to have_password_confirmation_input }
      it { expect(new_admin_page.fields).to have_create_button }
      it { expect(new_admin_page.fields).to have_cancel_button }
    end

    context 'when fill in form with valid params' do
      let(:admin_params) { attributes_for(:admin_user) }

      before { new_admin_page.fields.submit(admin_params[:email], admin_params[:password]) }

      it { expect(new_admin_page.text).to have_content(admin_params[:email]) }
      it { expect(new_admin_page.text).to have_content(I18n.t('notice.admin.saved')) }
    end

    context 'when fill in form with invalid params' do
      let(:admin_params) { attributes_for(:admin_user, email: '') }

      before { new_admin_page.fields.submit(admin_params[:email], admin_params[:password]) }

      it { expect(new_admin_page.fields.email_row.text).to have_content(I18n.t('alert.blank')) }
      it { expect(new_admin_page.fields.email_input.value).to have_content(admin_params[:email]) }
      it { expect(new_admin_page.fields.password_input.value).not_to have_content(admin_params[:password]) }
      it { expect(new_admin_page.fields.password_confirmation_input.value).not_to have_content(admin_params[:password]) }
    end
  end

  describe '/show' do
    let(:admin_page) { Pages::Admin::AdminUser.new }

    before { admin_page.load(id: admin.id) }

    it { expect(admin_page.admin_details).to have_header }
    it { expect(admin_page.admin_details).to have_email_row }
    it { expect(admin_page.admin_details).to have_reset_password_token_list_row }
    it { expect(admin_page.admin_details).to have_reset_password_sent_at_row }
    it { expect(admin_page.admin_details).to have_remember_created_at_row }
    it { expect(admin_page.admin_details).to have_created_at_row }
    it { expect(admin_page.admin_details).to have_updated_at_row }

    it { expect(admin_page.admin_details.email_row.text).to have_content(admin.email) }
    it { expect(admin_page.admin_details.reset_password_token_list_row.text).to have_content(admin.reset_password_token) }
    it { expect(admin_page.admin_details.reset_password_sent_at_row.text).to have_content(admin.reset_password_sent_at) }
    it { expect(admin_page.admin_details.remember_created_at_row.text).to have_content(admin.remember_created_at) }
  end
end
