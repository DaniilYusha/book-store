RSpec.describe 'settings#index', type: :feature do
  let(:user) { create(:user) }
  let(:sign_in_page) { Pages::SignIn.new }
  let(:settings_page) { Pages::Settings.new }

  before do
    sign_in_page.load
    sign_in_page.sign_in_form.authenticate_user(user.email, user.password)
    settings_page.load
  end

  describe 'header section' do
    it { expect(settings_page).to have_content(I18n.t('devise.registrations.edit.header')) }
    it { expect(settings_page.settings_list).to have_address_link }
    it { expect(settings_page.settings_list).to have_privacy_link }
  end

  describe 'addresses section' do
    let(:valid_address_params) { attributes_for(:address) }
    let(:invalid_address_params) do
      attributes_for(:address, first_name: '', last_name: '', address: '', city: '', zip_code: '', phone: '000')
    end

    context 'with billing address inputs' do
      it { expect(settings_page.billing_address_form).to have_first_name_input }
      it { expect(settings_page.billing_address_form).to have_last_name_input }
      it { expect(settings_page.billing_address_form).to have_address_input }
      it { expect(settings_page.billing_address_form).to have_city_input }
      it { expect(settings_page.billing_address_form).to have_zip_code_input }
      it { expect(settings_page.billing_address_form).to have_country_select }
      it { expect(settings_page.billing_address_form).to have_phone_input }
    end

    context 'with shipping address inputs' do
      it { expect(settings_page.shipping_address_form).to have_first_name_input }
      it { expect(settings_page.shipping_address_form).to have_last_name_input }
      it { expect(settings_page.shipping_address_form).to have_address_input }
      it { expect(settings_page.shipping_address_form).to have_city_input }
      it { expect(settings_page.shipping_address_form).to have_zip_code_input }
      it { expect(settings_page.shipping_address_form).to have_country_select }
      it { expect(settings_page.shipping_address_form).to have_phone_input }
    end

    context 'with invalid billing address params' do
      before { settings_page.billing_address_form.submit(invalid_address_params) }

      it { expect(settings_page).to have_content(I18n.t('validation.names_format')) }
      it { expect(settings_page).to have_content(I18n.t('validation.address_format')) }
      it { expect(settings_page).to have_content(I18n.t('validation.zip_format')) }
      it { expect(settings_page).to have_content(I18n.t('validation.phone_format')) }
      it { expect(settings_page).to have_content(I18n.t('validation.phone_country_code')) }
      it { expect(settings_page.billing_address_form.country_select.value).to eq(invalid_address_params[:country]) }
    end

    context 'with valid billing address params' do
      before { settings_page.billing_address_form.submit(valid_address_params) }

      it { expect(settings_page).to have_content(I18n.t('notice.address.saved')) }

      %i[first_name last_name address zip_code city phone].each do |field|
        it {
          expect(settings_page.billing_address_form.public_send("#{field}_input").value)
            .to eq(valid_address_params[field])
        }
      end

      it { expect(settings_page.billing_address_form.country_select.value).to eq(valid_address_params[:country]) }
    end

    context 'with invalid shipping address params' do
      before { settings_page.shipping_address_form.submit(invalid_address_params) }

      it { expect(settings_page).to have_content(I18n.t('validation.names_format')) }
      it { expect(settings_page).to have_content(I18n.t('validation.address_format')) }
      it { expect(settings_page).to have_content(I18n.t('validation.zip_format')) }
      it { expect(settings_page).to have_content(I18n.t('validation.phone_format')) }
      it { expect(settings_page).to have_content(I18n.t('validation.phone_country_code')) }
      it { expect(settings_page.shipping_address_form.country_select.value).to eq(invalid_address_params[:country]) }
    end

    context 'with valid shipping address params' do
      before { settings_page.shipping_address_form.submit(valid_address_params) }

      it { expect(settings_page).to have_content(I18n.t('notice.address.saved')) }

      %i[first_name last_name address zip_code city phone].each do |field|
        it {
          expect(settings_page.shipping_address_form.public_send("#{field}_input").value)
            .to eq(valid_address_params[field])
        }
      end

      it { expect(settings_page.shipping_address_form.country_select.value).to eq(valid_address_params[:country]) }
    end
  end

  describe 'privacy section' do
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
      let(:new_valid_password) { 'Rails2020' }

      before { settings_page.password_form.fill_in(user.password, new_valid_password) }

      it { expect(settings_page).to have_current_path(settings_path) }
      it { expect(settings_page).to have_content(I18n.t('devise.registrations.updated')) }

      it { expect(settings_page.password_form.old_password_input.value).to be_nil }
      it { expect(settings_page.password_form.new_password_input.value).to be_nil }
      it { expect(settings_page.password_form.password_confirm_input.value).to be_nil }
    end

    context 'with invalid password inputs' do
      let(:new_invalid_password) { '!' }

      before { settings_page.password_form.fill_in(user.password, new_invalid_password) }

      it { expect(settings_page).to have_content(I18n.t('alert.privacy')) }

      it {
        expect(settings_page).to have_content(
          I18n.t('activerecord.errors.models.user.attributes.password.invalid')
        )
      }

      it { expect(settings_page.password_form.old_password_input.value).to be_nil }
      it { expect(settings_page.password_form.new_password_input.value).to be_nil }
      it { expect(settings_page.password_form.password_confirm_input.value).to be_nil }
    end

    context 'with remove account form' do
      it { expect(settings_page.remove_account).to have_header }
      it { expect(settings_page.remove_account).to have_remove_confirm_checkbox }
      it { expect(settings_page.remove_account).to have_remove_account_button }
      it { expect(settings_page.remove_account.remove_account_button[:disabled]).to eq('disabled') }
    end

    context 'when click remove account button' do
      before { settings_page.remove_account.remove_account }

      it { expect(settings_page).to have_current_path(root_path) }
      it { expect(settings_page).to have_content(I18n.t('devise.registrations.destroyed')) }
    end

    context 'with change email form' do
      it { expect(settings_page.email_form).to have_header }
      it { expect(settings_page.email_form).to have_email_label }
      it { expect(settings_page.email_form).to have_email_input }
      it { expect(settings_page.email_form).to have_save_button }
    end

    context 'when fill in email form' do
      let(:new_valid_email) { 'daniil@gmail.com' }

      before { settings_page.email_form.submit(new_valid_email) }

      it { expect(settings_page).to have_current_path(settings_path) }
      it { expect(settings_page).to have_content(I18n.t('devise.registrations.updated')) }
      it { expect(settings_page.email_form.email_input.value).to eq(user.email) }
    end

    context 'when fill in form with invalid email' do
      let(:new_invalid_email) { '!!!' }

      before { settings_page.email_form.submit(new_invalid_email) }

      it { expect(settings_page).to have_content(I18n.t('alert.privacy')) }
      it { expect(settings_page).to have_content(I18n.t('activerecord.errors.models.user.attributes.email.invalid')) }
    end
  end
end
