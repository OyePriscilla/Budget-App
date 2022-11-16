require 'rails_helper'

RSpec.describe 'Splash', type: :request do
  before(:each) { get unauthenticated_root_path }
  describe 'Testing index method for splash controller' do
    it 'should have http status ok' do
      expect(response).to have_http_status :ok
    end
    it 'should render index page' do
      expect(response).to render_template :index
    end
    it 'should have some html' do
      expect(response.body).to include 'Budget App'
    end
  end
end
