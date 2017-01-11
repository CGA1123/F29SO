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
  let(:perm1) { FactoryGirl.create(:permission) }
  let(:perm2) { FactoryGirl.create(:permission) }

  describe '#permission_strings' do
    it 'returns names of all permissions held by group' do
      # We need to create an extra permission to make sure that this method only
      # returns the correct permissions, rather than all permissions
      FactoryGirl.create(:permission)
      project_group.permissions << [perm1, perm2]
      expect(project_group.permission_strings).to match_array \
        ["#{project_group.project_id}.#{perm1.name}",
         "#{project_group.project_id}.#{perm2.name}"]
    end
  end
end
