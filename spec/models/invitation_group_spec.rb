require 'rails_helper'

RSpec.describe InvitationGroup, type: :model do
  it_behaves_like 'join table', :invitation, :group
end
