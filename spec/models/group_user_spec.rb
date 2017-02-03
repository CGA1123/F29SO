require 'rails_helper'

RSpec.describe GroupUser, type: :model do
  it_behaves_like 'join table', :group, :user

  describe '#check_if_last_group' do
    let(:user) { FactoryGirl.create(:user) }
    let(:group_user) { user.group_users.first }

    it 'returns false if user only has one group' do
      expect(group_user.send(:check_if_last_group)).to be(false)
    end

    it 'return true if user has more than 1 group' do
      user.groups << FactoryGirl.create(:group)
      expect(group_user.send(:check_if_last_group)).to be(true)
    end
  end
end
