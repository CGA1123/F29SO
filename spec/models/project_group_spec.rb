require 'rails_helper'

RSpec.describe ProjectGroup, type: :model do
  it { is_expected.to have_many(:project_group_permissions) }
  it { is_expected.to belong_to(:project) }
  it { is_expected.to belong_to(:group) }

  it do
    is_expected.to validate_uniqueness_of(:group_id).scoped_to(:project_id)
  end

  it do
    is_expected.to have_many(:project_permissions)
      .through(:project_group_permissions)
  end
end
