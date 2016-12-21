require 'rails_helper'

RSpec.describe Project, type: :model do
  it { is_expected.to validate_presence_of(:project_name) }
  it { is_expected.to validate_presence_of(:project_code) }
  it { is_expected.to validate_uniqueness_of(:project_code).case_insensitive }
  it { is_expected.to have_many(:project_groups) }
  it { is_expected.to have_many(:groups).through(:project_groups) }
end
