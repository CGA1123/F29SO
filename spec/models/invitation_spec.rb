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

  let(:existing_user) { FactoryGirl.create(:user) }

  describe 'validate that a user with email does not already exist' do
    it 'does not allow invitation to existing user' do
      invitation = Invitation.new(email: existing_user.email,
                                  groups: existing_user.groups,
                                  sent_at: Time.now.getlocal,
                                  token: 'token')
      expect(invitation).not_to be_valid
    end

    it 'does not allow invitation to existing user' do
      invitation = Invitation.new(email: 'waddup@test.com',
                                  groups: [FactoryGirl.create(:group)],
                                  sent_at: Time.now.getlocal,
                                  token: 'token')
      expect(invitation).to be_valid
    end
  end
end
