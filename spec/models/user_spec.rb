require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to belong_to(:location) }
  it { is_expected.to have_many(:group_users).dependent(:delete_all) }
  it { is_expected.to have_many(:groups).through(:group_users) }
  it { is_expected.to have_many(:project_role_users) }
  it { is_expected.to have_many(:project_roles).through(:project_role_users) }
  it { is_expected.to have_many(:user_skills) }
  it { is_expected.to have_many(:skills).through(:user_skills) }

  it do
    is_expected.to have_many(:notifications).with_foreign_key(:recipient_id)
  end

  it { is_expected.to validate_presence_of(:groups) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:location) }

  let(:group) { FactoryGirl.create(:group) }
  let(:user) { FactoryGirl.create(:user, groups: [group]) }

  let(:project_role) { FactoryGirl.create(:project_role) }
  let(:proj_id) { project_role.project_id }
  let(:other_project_role) { FactoryGirl.create(:project_role) }
  let(:other_group) { FactoryGirl.create(:group) }
  let(:permission) { FactoryGirl.create(:permission) }
  let(:permission2) { FactoryGirl.create(:permission) }
  let(:permission3) { FactoryGirl.create(:permission) }

  describe '#permission?' do
    it 'returns true if User has the relevant permission' do
      group.permissions << permission
      expect(user.permission?(permission.name, permission3.name)).to be_truthy
    end

    it 'returns true if User has the relevant project permission' do
      user.project_roles << project_role
      project_role.permissions << permission
      expect(user.permission?("#{project_role.project_id}.#{permission.name}"))
        .to be_truthy
    end

    it 'returns false if User does not have the relevant permission' do
      expect(user.permission?('non.existent.permission', permission.name))
        .to be_falsy
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
      project_role.permissions << [permission, permission2]
      other_project_role.permissions << permission3
      user.project_roles << project_role
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
