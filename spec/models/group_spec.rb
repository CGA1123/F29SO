require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should have_many(:group_permissions) }
  it { should have_many(:permissions).through(:group_permissions) }
  it { should have_many(:user_groups) }
  it { should have_many(:users).through(:user_groups) }

  describe '#permission_strings' do
    it 'returns names of all permissions held by group' do
      group = FactoryGirl.create(:group)
      perm1 = FactoryGirl.create(:permission)
      perm2 = FactoryGirl.create(:permission)
      _perm3 = FactoryGirl.create(:permission)
      group.permissions << [perm1, perm2]

      expect(group.permission_strings).to match_array([perm1.name, perm2.name])
    end
  end
end
