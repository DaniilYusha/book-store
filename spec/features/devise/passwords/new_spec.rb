RSpec.describe 'devise/passwords#new', type: :feature do
  let(:user) { create(:user) }
  let(:forgot_password_page) { Pages::ForgotPassword.new }

  before { visit new_user_password_path }

  it { expect(forgot_password_page.auth_form_header).to have_page_name }

  it { expect(forgot_password_page.forgot_password_form).to have_email_label }
  it { expect(forgot_password_page.forgot_password_form).to have_email_field }
  it { expect(forgot_password_page.forgot_password_form).to have_send_instructions_button }
  it { expect(forgot_password_page.forgot_password_form).to have_cancel_button }

  context 'when fill registration form with valid data' do
    before do
      forgot_password_page.forgot_password_form.send_forgot_password_instructions(
        user.email
      )
    end

    it 'show password reset message' do
      expect(forgot_password_page).to have_content(
        I18n.t('devise.passwords.send_instructions')
      )
    end
  end

  context 'when fill registration form with invalid data' do
    let(:wrong_email) { 'ruby@test.com' }

    before do
      forgot_password_page.forgot_password_form.send_forgot_password_instructions(
        wrong_email
      )
    end

    it 'show email error' do
      expect(forgot_password_page).to have_content(
        I18n.t('errors.messages.not_found')
      )
    end
  end
end
