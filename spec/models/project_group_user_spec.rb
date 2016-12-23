require 'rails_helper'

RSpec.describe ProjectGroupUser, type: :model do
  it_behaves_like 'join table', :project_group, :user
end
