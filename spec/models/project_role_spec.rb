require 'rails_helper'

RSpec.describe ProjectRole, type: :model do
  it { is_expected.to have_many(:project_role_permissions) }
  it { is_expected.to have_many(:project_role_locations) }
  it { is_expected.to belong_to(:project) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:project) }
  it do
    is_expected.to validate_uniqueness_of(:name).scoped_to(:project_id)
      .case_insensitive
  end

  it do
    is_expected.to have_many(:locations)
      .through(:project_role_locations)
  end

  it do
    is_expected.to have_many(:permissions)
      .through(:project_role_permissions)
  end

  it do
    is_expected.to have_many(:users)
      .through(:project_role_users)
  end

  subject(:project_role) { FactoryGirl.create(:project_role) }
  let(:perm1) { FactoryGirl.create(:permission) }
  let(:perm2) { FactoryGirl.create(:permission) }

  describe '#permission_strings' do
    it 'returns names of all permissions held by group' do
      # We need to create an extra permission to make sure that this method only
      # returns the correct permissions, rather than all permissions
      FactoryGirl.create(:permission)
      project_role.permissions << [perm1, perm2]
      expect(project_role.permission_strings).to match_array \
        ["#{project_role.project_id}.#{perm1.name}",
         "#{project_role.project_id}.#{perm2.name}"]
    end
  end
end
