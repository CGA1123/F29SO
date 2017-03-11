require 'rails_helper'

RSpec.describe ProjectRoleSkill, type: :model do
  it_behaves_like 'join table', :project_role, :skill
  it { is_expected.to validate_presence_of(:rating) }
end
