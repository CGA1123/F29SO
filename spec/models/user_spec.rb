require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:user_groups) }
  it { is_expected.to have_many(:groups).through(:user_groups) }
  it { is_expected.to validate_presence_of(:groups) }
  it { is_expected.to validate_presence_of(:first_name).on(:update) }
  it { is_expected.to validate_presence_of(:last_name).on(:update) }

  let(:user) { FactoryGirl.create(:user) }

  let(:group) { user.groups.first }
  let(:other_group) { FactoryGirl.create(:group) }
  let(:permission) { FactoryGirl.create(:permission) }
  let(:permission2) { FactoryGirl.create(:permission) }
  let(:permission3) { FactoryGirl.create(:permission) }

  describe '#permission?' do
    it 'returns true if User has the relevant permission' do
      group.permissions << permission
      expect(user.permission?(permission.name)).to be_truthy
    end

    it 'returns false if User does not have the relevant permission' do
      expect(user.permission?('non.existent.permission')).to be_falsy
    end

    it 'always returns true if user is in the root group' do
      root = FactoryGirl.build(:root_user)
      expect(root.permission?('non.existent.permission')).to be_truthy
    end
  end

  describe '#permission_strings' do
    it 'returns names of permission held by user' do
      group.permissions << [permission, permission2]
      other_group.permissions << permission3
      user.groups << other_group
      expect(user.permission_strings)
        .to(match_array([permission.name, permission2.name, permission3.name]))
    end
  end

  describe '#name' do
    it 'returns concatenation of first_name & last_name' do
      expect(user.name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
