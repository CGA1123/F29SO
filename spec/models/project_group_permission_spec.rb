require 'rails_helper'

RSpec.describe ProjectGroupPermission, type: :model do
  it_behaves_like 'join table', :permission, :project_group

  it do
    is_expected.to validate_uniqueness_of(:permission_id)
      .scoped_to(:project_group_id)
  end
end
