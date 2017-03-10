require 'rails_helper'

RSpec.describe ProjectRoleLocation, type: :model do
  it_behaves_like 'join table', :project_role, :location
end
