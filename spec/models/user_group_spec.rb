require 'rails_helper'

RSpec.describe UserGroup, type: :model do
  it_behaves_like 'join table', :user, :group

  it { is_expected.to validate_uniqueness_of(:group_id).scoped_to(:user_id) }
end
