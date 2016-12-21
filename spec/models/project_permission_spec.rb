require 'rails_helper'

RSpec.describe ProjectPermission, type: :model do
  it { is_expected.to have_many(:project_group_permissions) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

  it do
    is_expected.to have_many(:project_groups)
      .through(:project_group_permissions)
  end
end
