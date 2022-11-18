require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.new(name: 'AdeJesu', email: 'ade@ade.com', password: 'AdeOye')
    @group = Group.new(name: 'Mercedes', user_id: @user.id)
    @user.save
  end
  describe 'Testing the validations for group model' do
    it 'should be valid' do
      expect(@group).to_not be_valid
    end
    it 'should be valid' do
      expect(@group.name).to eq 'Mercedes'
    end

    it 'group should have a name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'group has an icon' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end
  end
end
