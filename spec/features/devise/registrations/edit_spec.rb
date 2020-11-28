RSpec.describe 'devise/registrations#edit', type: :feature do
  let(:user) { create(:user) }
  let(:sign_in_page) { Pages::SignIn.new }
  let(:settings_page) { Pages::Settings.new }

  before do
    sign_in_page.load
    sign_in_page.sign_in_form.authenticate_user(user.email, user.password)
    settings_page.load
  end

  describe 'settings/header' do
    it { expect(settings_page).to have_content(I18n.t('devise.registrations.edit.header')) }
    it { expect(settings_page.settings_list).to have_address_link }
    it { expect(settings_page.settings_list).to have_privacy_link }
  end

  describe 'settings/address' do
    let(:billing_params) { attributes_for(:address) }
    let(:shipping_params) { attributes_for(:address, address_type: :shipping) }

    context 'with billing address inputs' do
      it { expect(settings_page.addresses_form).to have_billing_first_name_input }
      it { expect(settings_page.addresses_form).to have_billing_last_name_input }
      it { expect(settings_page.addresses_form).to have_billing_address_input }
      it { expect(settings_page.addresses_form).to have_billing_city_input }
      it { expect(settings_page.addresses_form).to have_billing_zip_input }
      it { expect(settings_page.addresses_form).to have_billing_country_select }
      it { expect(settings_page.addresses_form).to have_billing_phone_input }
    end

    context 'with shipping address inputs' do
      it { expect(settings_page.addresses_form).to have_shipping_first_name_input }
      it { expect(settings_page.addresses_form).to have_shipping_last_name_input }
      it { expect(settings_page.addresses_form).to have_shipping_address_input }
      it { expect(settings_page.addresses_form).to have_shipping_city_input }
      it { expect(settings_page.addresses_form).to have_shipping_zip_input }
      it { expect(settings_page.addresses_form).to have_shipping_country_select }
      it { expect(settings_page.addresses_form).to have_shipping_phone_input }
    end

    context 'when user fill in an addresses form' do
      before { settings_page.addresses_form.submit(billing_params, shipping_params) }

      it { expect(settings_page).to have_content(I18n.t('notice.address.saved')) }
      it { expect(user.billing_address).not_to be_nil }
      it { expect(user.shipping_address).not_to be_nil }
    end
  end

  describe 'settings/privacy' do
    let(:new_password) { 'Rails2020' }

    before { settings_page.settings_list.privacy_link.click }

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
