require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  before(:each) do
    @user = User.new(name: 'AdeJesu', email: 'ade@ade.com', password: 'AdeOye')
    @user.confirm
    @group = Group.create(name: 'Mercedes', icon: 'photo.png', user: @user.id)
    visit new_user_session_path
    fill_in 'Email', with: 'ade@ade.com'
    fill_in 'Password', with: 'AdeOye'
    click_button 'Log in'
  end
  describe 'Testing index view of categories' do
    it 'should contain page heading' do
      expect(page).to have_content 'GROUPS'
    end
    it 'should contain sign out button' do
      expect(page).to have_content 'Sign out'
    end
    it 'should have category name' do
      expect(page).to have_content 'Mercedes'
    end
    it 'should have category name' do
      expect(page).to have_content '$0'
    end
  end

  describe 'Testing new view of categories' do
    before(:each) { click_link 'Create Category' }
    it 'should have name field' do
      expect(page).to have_field(type: 'text')
    end
    it 'should have file field' do
      expect(page).to have_field(type: 'file')
    end
    it 'should have submit field' do
      expect(page).to have_button(type: 'submit')
    end
  end
end
