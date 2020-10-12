RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  let(:facebook_hash) { OmniAuth::AuthHash.new(Faker::Omniauth.facebook) }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.auth'] = facebook_hash
  end

  it 'has regirect status' do
    get :facebook
    expect(response).to have_http_status :redirect
  end

  context 'when user exist' do
    before do
      allow(User).to receive(:from_omniauth).and_return(create(:user))
      get :facebook
    end

    it { expect(response).to redirect_to('/') }
  end
end
