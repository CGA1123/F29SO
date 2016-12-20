require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it { is_expected.to have_many(:invitation_groups) }
  it { is_expected.to have_many(:groups).through(:invitation_groups) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:token) }
  it { is_expected.to validate_presence_of(:sent_at) }
  it { is_expected.to validate_presence_of(:groups) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_uniqueness_of(:token) }
end
