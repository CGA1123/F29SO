require 'rails_helper'

RSpec.describe Permission, type: :model do
  it { should validate_presence_of(:permission_string) }
  it { should validate_presence_of(:description) }
  it { should validate_uniqueness_of(:permission_string).case_insensitive }
  it { should have_many(:group_permissions) }
  it { should have_many(:groups).through(:group_permissions) }
end
