require 'rails_helper'

RSpec.describe ProjectSkill, type: :model do
  it_behaves_like 'join table', :project, :skill
  it { is_expected.to validate_presence_of(:qualifier) }
end
