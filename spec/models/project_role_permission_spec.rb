require 'rails_helper'

RSpec.describe ProjectRolePermission, type: :model do
  it_behaves_like 'join table', :project_role, :permission
end
