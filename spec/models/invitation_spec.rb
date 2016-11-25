require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:token) }
  it { is_expected.to validate_presence_of(:sent_at) }
end
