RSpec.describe 'LogIn', type: :feature do
  let(:checkout_login_page) { Pages::Checkout::Login.new }

  before { checkout_login_page.load }

  it { expect(checkout_login_page).to have_current_path(checkout_login_path) }

  describe 'returning customer form' do
    it { expect(checkout_login_page.returning_customer).to have_form_header }
    it { expect(checkout_login_page.returning_customer).to have_email_label }
    it { expect(checkout_login_page.returning_customer).to have_email_field }
    it { expect(checkout_login_page.returning_customer).to have_password_label }
    it { expect(checkout_login_page.returning_customer).to have_password_field }
    it { expect(checkout_login_page.returning_customer).to have_forgot_password_link }
    it { expect(checkout_login_page.returning_customer).to have_login_with_password_button }

    context 'when click forgot password link' do
      before { checkout_login_page.returning_customer.forgot_password_link.click }

      it { expect(checkout_login_page).to have_current_path(new_user_password_path) }
    end

    context 'when fill in the form' do
      let(:user) { create(:user) }

      before { checkout_login_page.returning_customer.fill_in_form(user) }

      it { expect(checkout_login_page).to have_content(I18n.t('devise.sessions.signed_in')) }
    end
  end

  describe 'new customer form' do
    it { expect(checkout_login_page.new_customer).to have_form_header }
    it { expect(checkout_login_page.new_customer).to have_email_label }
    it { expect(checkout_login_page.new_customer).to have_email_field }
    it { expect(checkout_login_page.new_customer).to have_continue_to_checkout_button }

    context 'when fill in the form' do
      let(:email) { 'checkout_login@gmail.com' }

      before { checkout_login_page.new_customer.fill_in_form(email) }

      it { expect(checkout_login_page).to have_content(I18n.t('devise.passwords.send_instructions')) }
    end
  end
end
