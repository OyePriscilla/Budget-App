require 'rails_helper'

RSpec.describe '/groups', type: :request do
  before(:each) do
    @user = User.new(name: 'AdeJesu', email: 'ade@ade.com', password: 'AdeOye')
    @user.confirm
    sign_in @user
    @group = Group.create(name: 'Mercedes', icon: 'photo.png', user: @user.id)
    @group.save
    get groups_path
  end

  describe 'Testing the index method of Category controller' do
    it 'should have http status ok' do
      expect(response).to have_http_status :ok
    end

    it 'should render index page' do
      expect(response).to render_template :index
    end

    it 'should have some html' do
      expect(response.body).to include 'GROUPS'
    end

    it 'should have category' do
      expect(response.body).to include 'Mercedes'
    end
  end
  describe 'Testing the new method of Category controller' do
    before(:each) { get new_group_path }
    it 'should have http status ok' do
      expect(response).to have_http_status :ok
    end

    it 'should render index page' do
      expect(response).to render_template :new
    end

    it 'should have some html' do
      expect(response.body).to include 'Create Category'
    end
  end
end
