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
end
