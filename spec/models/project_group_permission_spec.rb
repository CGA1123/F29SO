require 'rails_helper'

RSpec.describe ProjectGroupPermission, type: :model do
  it_behaves_like 'join table', :project_group, :permission
end
