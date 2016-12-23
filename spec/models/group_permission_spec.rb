require 'rails_helper'

RSpec.describe GroupPermission, type: :model do
  it_behaves_like 'join table', :group, :permission

  it do
    is_expected.to validate_uniqueness_of(:permission_id).scoped_to(:group_id)
  end
end
