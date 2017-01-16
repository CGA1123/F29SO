require 'rails_helper'

RSpec.describe Skill, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to have_many(:user_skills) }
  it { is_expected.to have_many(:users).through(:user_skills) }
  it { is_expected.to have_many(:project_skills) }
  it { is_expected.to have_many(:projects).through(:project_skills) }
end
