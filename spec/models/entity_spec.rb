require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.new(name: 'AdeJesu', email: 'ade@ade.com', password: 'AdeOye')
    @group = Group.create(name: 'Mercedes', user_id: @user.id)
    @entity = Entity.create(name: 'Brand', amount: 20, group_id: @group.id, user_id: @user.id)
  end
  describe 'Testing the validations for group model' do
    it 'should be valid' do
      expect(@entity).to_not be_valid
    end
    it 'should be valid' do
      expect(@entity.name).to eq 'Brand'
    end
    it 'should be valid' do
      expect(@entity.amount).to eq 20
    end
  end
end
