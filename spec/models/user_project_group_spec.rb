require 'rails_helper'

RSpec.describe UserProjectGroup, type: :model do
  it_behaves_like 'join table', :user, :project_group

  it do
    is_expected.to validate_uniqueness_of(:project_group_id).scoped_to(:user_id)
  end
end
