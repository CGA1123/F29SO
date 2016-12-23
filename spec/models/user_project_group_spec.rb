require 'rails_helper'

RSpec.describe UserProjectGroup, type: :model do
  it_behaves_like 'join table', :user, :project_group
end
