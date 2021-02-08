RSpec.describe RegistrationsController, type: :controller do
  describe '#create' do
    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      post :create, params: { user: params }
    end

    context 'when quick registrate user with valid email' do
      let(:params) { { email: attributes_for(:user)[:email], quick_register: true } }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:notice]).to eq(I18n.t('devise.passwords.send_instructions')) }
    end

    context 'when quick registrate user with blank email' do
      let(:params) { { email: '', quick_register: true } }
      let(:user) { User.new(email: params[:email]) }

      before { user.validate }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:alert]).to eq(user.errors.full_messages_for(:email).to_sentence) }
    end

    context 'when quick registrate user with existing email' do
      let(:user) { create(:user) }
      let(:params) { { email: user.email, quick_register: true } }
      let(:new_user) { User.new(email: user.email) }

      before { new_user.validate }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(flash[:alert]).to eq(new_user.errors.full_messages_for(:email).to_sentence) }
    end
  end
end
