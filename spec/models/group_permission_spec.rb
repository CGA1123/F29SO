require 'rails_helper'

RSpec.describe GroupPermission, type: :model do
  it { is_expected.to belong_to(:group) }
  it { is_expected.to belong_to(:permission) }
  it do
    is_expected.to validate_uniqueness_of(:permission_id).scoped_to(:group_id)
  end
end
