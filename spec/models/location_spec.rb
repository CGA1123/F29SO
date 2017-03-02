require 'rails_helper'

RSpec.describe Location, type: :model do
  it { is_expected.to have_many(:users) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to have_many(:project_locations) }
  it { is_expected.to have_many(:projects).through(:project_locations) }
end
