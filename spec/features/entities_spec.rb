require 'rails_helper'

RSpec.describe 'Entity', type: :feature do
  before(:each) do
    @user = User.new(name: 'AdeJesu', email: 'ade@ade.com', password: 'AdeOye')
    @user.confirm
    @group = Group.create(name: 'Mercedes', icon: 'photo.png', user: @user.id)
    @entity = Entity.create(name:"Brand", amount: 20, created_at: Time.now,
                             updated_at: Time.now, group_id: @group.id, user_id: @user.id)

    visit new_user_session_path
    fill_in 'Email', with: 'ade@ade.com'
    fill_in 'Password', with: 'AdeOye'
    click_button 'Log in'
  end
  describe 'Testing index view of transaction' do
    before(:each) do
      click_link 'Mercedes'
    end
    it 'should contain page heading' do
      expect(page).to have_content 'ENTITIES'
    end
    it 'should contain sign out button' do
      expect(page).to have_content 'Sign out'
    end
    it 'should have transaction name' do
      expect(page).to have_content 'Over Time'
    end
    it 'should have transaction amount' do
      expect(page).to have_content '$20'
    end
  end

  describe 'Testing new view of transaction' do
    before(:each) do
      click_link 'Mercedes'
      click_link 'Create Entity'
    end
    it 'should have heading' do
      expect(page).to have_content 'CREATE ENTITY'
    end
    it 'should have name field' do
      expect(page).to have_field(type: 'text')
    end
    it 'should have submit field' do
      expect(page).to have_button(type: 'submit')
    end
  end
end