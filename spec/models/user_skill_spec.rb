require 'rails_helper'

RSpec.describe UserSkill, type: :model do
  it_behaves_like 'join table', :user, :skill
  it { is_expected.to validate_presence_of(:rating) }
end
