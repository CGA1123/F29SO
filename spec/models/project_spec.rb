require 'rails_helper'

RSpec.describe Project, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:code) }
  it { is_expected.to validate_uniqueness_of(:code).case_insensitive }
  it { is_expected.to validate_presence_of(:project_type) }
  it { is_expected.to have_many(:project_roles) }
  it { is_expected.to have_many(:users).through(:project_roles) }
  it { is_expected.to have_many(:locations).through(:project_roles) }
  it { is_expected.to belong_to(:project_type) }
end
