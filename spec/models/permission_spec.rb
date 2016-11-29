require 'rails_helper'

RSpec.describe Permission, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to have_many(:group_permissions) }
  it { is_expected.to have_many(:groups).through(:group_permissions) }
end
