require 'rails_helper'

RSpec.describe InvitationGroup, type: :model do
  it { is_expected.to belong_to(:invitation) }
  it { is_expected.to belong_to(:group) }
  it do
    is_expected.to validate_uniqueness_of(:group_id).scoped_to(:invitation_id)
  end
end
