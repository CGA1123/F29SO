require 'rails_helper'

RSpec.describe UserGroup, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:group) }
  it { is_expected.to validate_uniqueness_of(:group_id).scoped_to(:user_id) }
end
