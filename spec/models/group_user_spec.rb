require 'rails_helper'

RSpec.describe GroupUser, type: :model do
  it_behaves_like 'join table', :group, :user
end
