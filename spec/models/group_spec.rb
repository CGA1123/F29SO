require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should validate_presence_of(:group_name) }
  it { should validate_presence_of(:description) }
  it { should validate_uniqueness_of(:group_name).case_insensitive }
  it { should have_many(:group_permissions) }
  it { should have_many(:permissions).through(:group_permissions) }
end
