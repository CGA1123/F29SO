require 'rails_helper'

RSpec.describe GroupPermission, type: :model do
  it { should belong_to(:group) }
  it { should belong_to(:permission) }
  it { should validate_uniqueness_of(:permission_id).scoped_to(:group_id) }
end
