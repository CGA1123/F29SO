require 'rails_helper'

RSpec.describe ProjectGroupPermission, type: :model do
  it { is_expected.to belong_to(:project_group) }
  it { is_expected.to belong_to(:permission) }

  it do
    is_expected.to validate_uniqueness_of(:permission_id)
      .scoped_to(:project_group_id)
  end
end
