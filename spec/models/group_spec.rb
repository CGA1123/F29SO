require 'rails_helper'

RSpec.describe Group, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to have_many(:group_permissions) }
  it { is_expected.to have_many(:permissions).through(:group_permissions) }
  it { is_expected.to have_many(:group_users) }
  it { is_expected.to have_many(:users).through(:group_users) }

  subject(:group) { FactoryGirl.create(:group) }

  describe '#permission_strings' do
    # _perm3 is not used, however we need to create it to check that
    # Group#permission_strings only return permissions that are assigned to
    # the Group, as opposed to simply returning all permissions in the
    # database.
    it 'returns names of all permissions held by group' do
      perm1 = FactoryGirl.create(:permission)
      perm2 = FactoryGirl.create(:permission)
      _perm3 = FactoryGirl.create(:permission)
      group.permissions << [perm1, perm2]
      expect(group.permission_strings).to match_array([perm1.name, perm2.name])
    end
  end
end
