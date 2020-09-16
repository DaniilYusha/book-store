RSpec.describe PagesController, type: :controller do
  describe 'GET /' do
    before { visit root_path }

    it 'returns http success' do
      expect(response).to have_http_status :success
    end

    it 'render home/index template' do
      expect(response).to render_template :home
    end
  end
end
