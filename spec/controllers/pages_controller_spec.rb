RSpec.describe PagesController, type: :controller do
  describe 'GET /' do
    before { visit root_path }

    it 'has current path' do
      expect(page).to have_current_path root_path
    end

    it 'returns http success' do
      expect(response).to have_http_status :success
    end

    it 'render home/index template' do
      expect(response).to render_template :index
    end
  end
end
