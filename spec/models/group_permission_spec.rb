require 'rails_helper'

RSpec.describe GroupPermission, type: :model do
  it_behaves_like 'join table', :group, :permission
end
