require 'rails_helper'

RSpec.describe UserGroup, type: :model do
  it_behaves_like 'join table', :user, :group
end
