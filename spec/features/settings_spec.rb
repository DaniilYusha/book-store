RSpec.describe 'settings#index', type: :feature do
  let(:user) { create(:user) }
  let(:settings_page) { Pages::Settings.new }

  before do
    login_as(user)
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
      %i[first_name_input last_name_input address_input city_input
         zip_code_input country_select phone_input].each do |field|
        it { expect(settings_page.billing_address_form).to public_send("have_#{field}") }
      end
    end

    context 'with shipping address inputs' do
      %i[first_name_input last_name_input address_input city_input
         zip_code_input country_select phone_input].each do |field|
        it { expect(settings_page.shipping_address_form).to public_send("have_#{field}") }
      end
    end

    context 'with invalid billing address params' do
      let(:result_messages) do
        {
          invalid_name: I18n.t('validation.names_format'),
          invalid_address: I18n.t('validation.address_format'),
          invalid_zip_code: I18n.t('validation.zip_format'),
          invalid_phone: I18n.t('validation.phone_format'),
          invalid_country_code: I18n.t('validation.phone_country_code')
        }
      end

      before { settings_page.billing_address_form.submit(invalid_address_params) }

      result_messages.each_value do |message|
        it { expect(settings_page).to have_content(message) }
      end

      it {
        expect(settings_page.billing_address_form.country_select.value)
          .to have_content(invalid_address_params[:country])
      }

      %i[first_name last_name address zip_code city phone].each do |field|
        it {
          expect(settings_page.billing_address_form.public_send("#{field}_input").value)
            .to have_content(invalid_address_params[field])
        }
      end
    end

    context 'with valid billing address params' do
      before { settings_page.billing_address_form.submit(valid_address_params) }

      it { expect(settings_page).to have_content(I18n.t('notice.address.saved')) }

      it {
        expect(settings_page.billing_address_form.country_select.value)
          .to have_content(valid_address_params[:country])
      }

      %i[first_name last_name address zip_code city phone].each do |field|
        it {
          expect(settings_page.billing_address_form.public_send("#{field}_input").value)
            .to have_content(valid_address_params[field])
        }
      end
    end

    context 'with invalid shipping address params' do
      let(:result_messages) do
        {
          invalid_name: I18n.t('validation.names_format'),
          invalid_address: I18n.t('validation.address_format'),
          invalid_zip_code: I18n.t('validation.zip_format'),
          invalid_phone: I18n.t('validation.phone_format'),
          invalid_country_code: I18n.t('validation.phone_country_code')
        }
      end

      before { settings_page.shipping_address_form.submit(invalid_address_params) }

      result_messages.each_value do |message|
        it { expect(settings_page).to have_content(message) }
      end

      it {
        expect(settings_page.shipping_address_form.country_select.value)
          .to have_content(invalid_address_params[:country])
      }

      %i[first_name last_name address zip_code city phone].each do |field|
        it {
          expect(settings_page.shipping_address_form.public_send("#{field}_input").value)
            .to have_content(invalid_address_params[field])
        }
      end
    end

    context 'with valid shipping address params' do
      before { settings_page.shipping_address_form.submit(valid_address_params) }

      it { expect(settings_page).to have_content(I18n.t('notice.address.saved')) }

      it {
        expect(settings_page.shipping_address_form.country_select.value)
          .to have_content(valid_address_params[:country])
      }

      %i[first_name last_name address zip_code city phone].each do |field|
        it {
          expect(settings_page.shipping_address_form.public_send("#{field}_input").value)
            .to have_content(valid_address_params[field])
        }
      end
    end
  end

  describe 'privacy section' do
    before { settings_page.settings_list.privacy_link.click }

    context 'with change email form' do
      it { expect(settings_page.email_form).to have_header }
      it { expect(settings_page.email_form).to have_email_label }
      it { expect(settings_page.email_form).to have_email_input }
      it { expect(settings_page.email_form).to have_save_button }
    end

    context 'when fill in email form with invalid email' do
      let(:new_invalid_email) { '!!!' }

      before { settings_page.email_form.submit(new_invalid_email) }

      it { expect(settings_page).to have_content(I18n.t('alert.privacy')) }
      it { expect(settings_page).to have_content(I18n.t('activerecord.errors.models.user.attributes.email.invalid')) }
      it { expect(settings_page.email_form.email_input.value).to have_content(new_invalid_email) }
    end

    context 'when fill in email form with valid email' do
      let(:new_valid_email) { 'daniil@gmail.com' }

      before { settings_page.email_form.submit(new_valid_email) }

      it { expect(settings_page).to have_current_path(settings_path) }
      it { expect(settings_page).to have_content(I18n.t('devise.registrations.updated')) }
      it { expect(settings_page.email_form.email_input.value).to have_content(user.email) }
    end

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

    context 'with valid password input' do
      let(:new_valid_password) { 'Rails2020' }

      before { settings_page.password_form.fill_in(user.password, new_valid_password) }

      it { expect(settings_page).to have_current_path(settings_path) }
      it { expect(settings_page).to have_content(I18n.t('devise.registrations.updated')) }

      it { expect(settings_page.password_form.old_password_input.value).not_to have_content(user.password) }
      it { expect(settings_page.password_form.new_password_input.value).not_to have_content(new_valid_password) }
      it { expect(settings_page.password_form.password_confirm_input.value).not_to have_content(new_valid_password) }
    end

    context 'with invalid password input' do
      let(:new_invalid_password) { '!' }

      before { settings_page.password_form.fill_in(user.password, new_invalid_password) }

      it { expect(settings_page).to have_content(I18n.t('alert.privacy')) }

      it {
        expect(settings_page).to have_content(
          I18n.t('activerecord.errors.models.user.attributes.password.invalid')
        )
      }

      it { expect(settings_page.password_form.old_password_input.value).not_to have_content(user.password) }
      it { expect(settings_page.password_form.new_password_input.value).not_to have_content(new_invalid_password) }
      it { expect(settings_page.password_form.password_confirm_input.value).not_to have_content(new_invalid_password) }
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
  end
end
