require 'rails_helper'

RSpec.describe ProjectGroup, type: :model do
  it { is_expected.to have_many(:project_group_permissions) }
  it { is_expected.to belong_to(:project) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:project) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

  it do
    is_expected.to have_many(:permissions)
      .through(:project_group_permissions)
  end

  it do
    is_expected.to have_many(:users)
      .through(:project_group_users)
  end

  subject(:project_group) { FactoryGirl.create(:project_group) }

  describe '#permission_strings' do
    # _perm3 is not used, however we need to create it to check that
    # Group#permission_strings only return permissions that are assigned to
    # the Group, as opposed to simply returning all permissions in the
    # database.
    it 'returns names of all permissions held by group' do
      perm1 = FactoryGirl.create(:permission)
      perm2 = FactoryGirl.create(:permission)
      _perm3 = FactoryGirl.create(:permission)
      project_group.permissions << [perm1, perm2]
      expect(project_group.permission_strings).to match_array([perm1.name, perm2.name])
    end
  end

end
