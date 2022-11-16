require 'rails_helper'

RSpec.describe '/entities', type: :request do
  before(:each) do
    @user = User.new(name: 'AdeJesu', email: 'ade@ade.com', password: 'AdeOye')
    @user.confirm
    sign_in @user
    @group = Group.create(name: 'Mercedes', icon: 'photo.png', user: @user.id)
    @entity = Entity.create(name: 'Brand', amount: 20, created_at: Time.now,
                            updated_at: Time.now, group_id: @group.id, user_id: @user.id)
    get group_entities_path(@group)
  end
  describe 'Testing the index method of Transaction controller' do
    it 'should have http status ok' do
      expect(response).to have_http_status :ok
    end
    it 'should render index page' do
      expect(response).to render_template :index
    end
    it 'should have some html' do
      expect(response.body).to include 'ENTITIES'
    end
  end

  describe 'Testing the new method of Transaction controller' do
    before(:each) { get new_group_entity_path(@group) }
    it 'should have http status ok' do
      expect(response).to have_http_status :ok
    end
    it 'should render new page' do
      expect(response).to render_template :new
    end
    it 'should have some html' do
      expect(response.body).to include '<h1>New entity</h1>'
    end
  end
end
