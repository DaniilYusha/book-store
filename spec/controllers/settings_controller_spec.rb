RSpec.describe SettingsController, type: :controller do
  describe 'GET /books' do
    before { get :index }

    it { expect(response).to have_http_status :success }
  end
end
