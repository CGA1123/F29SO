require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it { is_expected.to belong_to(:inviter) }
  it { is_expected.to have_many(:invitation_groups) }
  it { is_expected.to have_many(:groups).through(:invitation_groups) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:token) }
  it { is_expected.to validate_presence_of(:sent_at) }
  it { is_expected.to validate_presence_of(:groups) }
  it { is_expected.to validate_presence_of(:inviter) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_uniqueness_of(:token) }

  let(:existing_user) { FactoryGirl.create(:user) }

  describe 'validate that a user with email does not already exist' do
    it 'does not allow invitation to existing user' do
      invitation = FactoryGirl.build(:invitation, email: existing_user.email)
      expect(invitation).not_to be_valid
    end

    it 'allow invitation to non existing user' do
      invitation = FactoryGirl.build(:invitation)
      expect(invitation).to be_valid
    end
  end
end
