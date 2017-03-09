require 'rails_helper'

RSpec.describe ProjectRoleUser, type: :model do
  it_behaves_like 'join table', :project_role, :user
end
