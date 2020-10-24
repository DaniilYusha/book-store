RSpec.describe 'devise/registrations#edit', type: :feature do
  let(:user) { create(:user) }
  let(:valid_address) { build(:address) }
  let(:new_password) { 'Rails2020' }
  let(:sign_in_page) { Pages::SignIn.new }
  let(:settings_page) { Pages::Settings.new }

  before do
    visit new_user_session_path
    sign_in_page.sign_in_form.authenticate_user user.email, user.password
    visit edit_user_registration_path
  end

  describe 'settings/header' do
    it { expect(settings_page).to have_content(I18n.t('devise.registrations.edit.header')) }
    it { expect(settings_page.settings_list).to have_address_link }
    it { expect(settings_page.settings_list).to have_privacy_link }
  end

  describe 'settings/address' do
    context 'with billing form labels' do
      it { expect(settings_page.billing_address_form).to have_header }
      it { expect(settings_page.billing_address_form).to have_first_name_label }
      it { expect(settings_page.billing_address_form).to have_last_name_label }
      it { expect(settings_page.billing_address_form).to have_address_label }
      it { expect(settings_page.billing_address_form).to have_city_label }
      it { expect(settings_page.billing_address_form).to have_zip_label }
      it { expect(settings_page.billing_address_form).to have_country_label }
      it { expect(settings_page.billing_address_form).to have_phone_label }
    end

    context 'with billing form inputs' do
      it { expect(settings_page.billing_address_form).to have_first_name_input }
      it { expect(settings_page.billing_address_form).to have_last_name_input }
      it { expect(settings_page.billing_address_form).to have_address_input }
      it { expect(settings_page.billing_address_form).to have_city_input }
      it { expect(settings_page.billing_address_form).to have_zip_input }
      it { expect(settings_page.billing_address_form).to have_country_select }
      it { expect(settings_page.billing_address_form).to have_phone_input }
    end

    context 'when user fill in an address form' do
      before { settings_page.billing_address_form.fill_in(valid_address) }

      it { expect(settings_page).to have_content(I18n.t('notice.address.saved')) }
      it { expect(user.billing_address).not_to be_nil }
    end
  end

  describe 'settings/privacy' do
    before { settings_page.settings_list.move_to_privacy }

    context 'with change password form' do
      it { expect(settings_page.password_form).to have_header }
      it { expect(settings_page.password_form).to have_old_password_label }
      it { expect(settings_page.password_form).to have_new_password_label }
      it { expect(settings_page.password_form).to have_password_confirm_label }

      it { expect(settings_page.password_form).to have_old_password_input }
      it { expect(settings_page.password_form).to have_new_password_input }
      it { expect(settings_page.password_form).to have_password_confirm_input }

      it { expect(settings_page.password_form).to have_save_button }
    end

    context 'when change password' do
      before { settings_page.password_form.fill_in(user.password, new_password) }

      it { expect(settings_page).to have_current_path(root_path) }
      it { expect(settings_page).to have_content(I18n.t('devise.registrations.updated')) }
    end

    context 'with remove account form' do
      it { expect(settings_page.remove_account).to have_header }
      it { expect(settings_page.remove_account).to have_remove_confirm_checkbox }
      it { expect(settings_page.remove_account).to have_remove_account_button }
    end

    context 'with change email form' do
      it { expect(settings_page.email_form).to have_header }
      it { expect(settings_page.email_form).to have_email_label }
      it { expect(settings_page.email_form).to have_email_input }
      it { expect(settings_page.email_form).to have_save_button }
    end
  end
end
