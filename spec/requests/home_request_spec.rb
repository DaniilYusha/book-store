require 'rails_helper'

RSpec.describe 'Home', type: :request do
  it 'render home/index template' do
    get '/'
    expect(response).to render_template(:index)
  end
end
