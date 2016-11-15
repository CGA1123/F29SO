require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should have_many(:group_permissions) }
  it { should have_many(:permissions).through(:group_permissions) }
  it { should have_many(:user_groups) }
  it { should have_many(:users).through(:user_groups) }

  subject { FactoryGirl.create(:group) }

  describe '#permission_strings' do
    it 'returns names of all permissions held by group' do
      permission1 = FactoryGirl.create(:permission)
      permission2 = FactoryGirl.create(:permission)
      # _permission3 is not used, however we need to create it to check that
      # Group#permission_strings only return permissions that are assigned to
      # the Group, as opposed to simply returning all permissions in the
      # database.
      _permission3 = FactoryGirl.create(:permission)
      subject.permissions << [permission1, permission2]

      expect(subject.permission_strings)
        .to match_array([permission1.name, permission2.name])
    end
  end
end
