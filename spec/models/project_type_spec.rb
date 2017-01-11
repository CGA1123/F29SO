require 'rails_helper'

RSpec.describe ProjectType, type: :model do
  it { is_expected.to have_many(:projects) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
end
