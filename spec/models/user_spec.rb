require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:user_groups) }
  it { should have_many(:groups).through(:user_groups) }
  it { should validate_presence_of(:groups) }

  describe '#permission?' do
    it 'returns true if User has the relevant permission' do
      user = FactoryGirl.create(:user)
      group = user.groups.first
      permission = FactoryGirl.create(:permission)
      group.permissions << permission

      expect(user.permission?(permission.name)).to be_truthy
    end

    it 'returns false if User does not have the relevant permission' do
      user = FactoryGirl.create(:user)
      expect(user.permission?('non.existent.permission')).to be_falsy
    end
  end

  describe '#permission_strings' do
    it 'returns names of permission held by user' do
      user = FactoryGirl.create(:user)
      group1 = user.groups.first
      group2 = FactoryGirl.create(:group)
      perm1 = FactoryGirl.create(:permission)
      perm2 = FactoryGirl.create(:permission)
      perm3 = FactoryGirl.create(:permission)
      group1.permissions << [perm1, perm2]
      group2.permissions << perm3
      user.groups << group2

      expect(user.permission_strings)
        .to(match_array([perm1.name, perm2.name, perm3.name]))
    end
  end
end
