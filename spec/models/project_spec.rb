require 'rails_helper'

RSpec.describe Project, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:code) }
  it { is_expected.to validate_uniqueness_of(:code).case_insensitive }
  it { is_expected.to have_many(:project_groups) }
  it { is_expected.to have_many(:users).through(:project_groups) }
end
