require 'rails_helper'

RSpec.describe 'Log in page', type: :feature do
  before(:each) do
    @user = User.new(name: 'AdeJesu', email: 'ade@ade.com', password: 'AdeOye')

    visit new_user_session_path
      fill_in 'Email', with: 'ade@ade.com'
      fill_in 'Password', with: 'AdeOye'
      click_button 'Log in'
      visit groups_path
  end

  describe 'integration' do
    before(:each) { visit new_user_session_path(@user) }

      scenario 'displays content' do
      expect(page).to have_content 'Log in'
    end

    scenario 'Submit form with incorrect email and password' do
      within 'form' do
        fill_in 'Email', with: 'ade@ade.com'
        fill_in 'Password', with: 'aaaaaaa'
      end
      click_button 'Log in'
      expect(page).to have_content 'Forgot your password'
    end

    scenario 'displays email' do
      expect(page).to have_content("Email")
    end

    scenario 'displays pagination' do
      expect(find('.actions')).to be_truthy
    end
  end
end