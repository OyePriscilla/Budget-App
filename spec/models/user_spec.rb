require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'AdeJesu', email: 'ade@ade.com', password: 'AdeOye')
  end
  describe 'Testing the validations for group model' do
    it 'should be valid' do
      expect(@user).to be_valid
    end
    it 'should be valid' do
      expect(@user.name).to eq 'AdeJesu'
    end
    it 'should be valid' do
      expect(@user.email).to eq 'ade@ade.com'
    end
    it 'should be valid' do
      expect(@user.password).to eq 'AdeOye'
    end
  end
end
