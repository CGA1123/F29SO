require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:group_users) }
  it { is_expected.to have_many(:groups).through(:group_users) }
  it { is_expected.to have_many(:project_group_users) }
  it { is_expected.to have_many(:project_groups).through(:project_group_users) }

  it { is_expected.to validate_presence_of(:groups) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  let(:group) { FactoryGirl.create(:group) }
  let(:user) { FactoryGirl.create(:user, groups: [group]) }

  let(:project_group) { FactoryGirl.create(:project_group) }
  let(:proj_id) { project_group.project_id }
  let(:other_project_group) { FactoryGirl.create(:project_group) }
  let(:other_group) { FactoryGirl.create(:group) }
  let(:permission) { FactoryGirl.create(:permission) }
  let(:permission2) { FactoryGirl.create(:permission) }
  let(:permission3) { FactoryGirl.create(:permission) }

  describe '#permission?' do
    it 'returns true if User has the relevant permission' do
      group.permissions << permission
      expect(user.permission?(permission.name)).to be_truthy
    end

    it 'returns true if User has the relevant project permission' do
      user.project_groups << project_group
      project_group.permissions << permission
      expect(user.permission?("#{project_group.project_id}.#{permission.name}"))
        .to be_truthy
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
      expect(user.permission_strings)
        .to(match_array([permission.name, permission2.name]))
    end

    it 'returns names of project permissions held by user' do
      project_group.permissions << [permission, permission2]
      other_project_group.permissions << permission3
      user.project_groups << project_group
      expect(user.permission_strings).to match_array \
        ["#{proj_id}.#{permission.name}", "#{proj_id}.#{permission2.name}"]
    end
  end

  describe '#name' do
    it 'returns concatenation of first_name & last_name' do
      expect(user.name).to eq("#{user.first_name} #{user.last_name}")
    end
  end

  describe '#initials' do
    it 'returns concatenation of first characters of first_name & last_name' do
      expect(user.initials).to eq("#{user.first_name[0]}#{user.last_name[0]}")
    end
  end
end
