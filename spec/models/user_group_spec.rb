require 'rails_helper'

RSpec.describe UserGroup, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:group) }
  it { should validate_uniqueness_of(:group_id).scoped_to(:user_id) }
end
