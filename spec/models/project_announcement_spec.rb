require 'rails_helper'

RSpec.describe ProjectAnnouncement, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to belong_to(:project) }
end
