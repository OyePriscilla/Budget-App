require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.new(name: 'AdeJesu', email: 'ade@ade.com', password: 'AdeOye')
    @group = Group.create(name: 'Mercedes', icon: 'photo.png', user: @user.id)
  end
  describe 'Testing the validations for group model' do
    it 'should be valid' do
      expect(@group).to be_valid
    end
    it 'should be valid' do
      expect(@group.name).to eq 'Mercedes'
    end
    it 'should be valid' do
      expect(@group.icon).to eq 'photo.png'
    end
  end
end
