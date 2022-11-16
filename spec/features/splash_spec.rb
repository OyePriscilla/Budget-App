require 'rails_helper'

RSpec.describe 'splash', type: :feature do
  before(:each) { visit unauthenticated_root_path }
  describe 'Testing view of splash' do
    it 'should contain application name' do
      expect(page).to have_content 'Budget App'
    end
    it 'should contain login button' do
      expect(page).to have_content 'Login'
    end
    it 'should be valid' do
      expect(page).to have_content 'Sign up'
    end
  end
end
