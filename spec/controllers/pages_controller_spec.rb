RSpec.describe PagesController, type: :controller do
  describe 'GET /' do
    before { get :home }

    it { expect(response).to have_http_status :success }
  end
end
