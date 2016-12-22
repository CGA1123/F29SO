require 'rails_helper'

RSpec.describe UserProjectGroup, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:project_group) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:project_group) }

  it do
    is_expected.to validate_uniqueness_of(:project_group_id).scoped_to(:user_id)
  end
end
