require 'rails_helper'

RSpec.describe 'login', type: :feature do
  before(:each) do
    visit unauthenticated_root_path
    click_link 'Login'
  end
  describe 'Testing login page' do
    it 'should contain email field' do
      expect(page).to have_field(type: 'email')
    end
    it 'should contain password field' do
      expect(page).to have_field(type: 'password')
    end
    it 'should contain login button' do
      expect(page).to have_button(type: 'submit')
    end
    it 'should has heading' do
      expect(page).to have_content 'LOGIN'
    end
    it 'should contain forgot password link' do
      expect(page).to have_link('Forgot your password?')
    end
  end
end
