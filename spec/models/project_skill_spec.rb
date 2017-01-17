require 'rails_helper'

RSpec.describe ProjectSkill, type: :model do
  it_behaves_like 'join table', :skill, :project
end
