require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:user_groups) }
  it { should have_many(:groups).through(:user_groups) }
  it { should validate_presence_of(:groups) }

  subject { FactoryGirl.create(:user) }

  let(:group) { subject.groups.first }
  let(:permission) { FactoryGirl.create(:permission) }

  describe '#permission?' do
    it 'returns true if User has the relevant permission' do
      group.permissions << permission
      expect(subject.permission?(permission.name)).to be_truthy
    end

    it 'returns false if User does not have the relevant permission' do
      expect(subject.permission?('non.existent.permission')).to be_falsy
    end
  end

  describe '#permission_strings' do
    it 'returns names of permission held by user' do
      other_group = FactoryGirl.create(:group)
      permission2 = FactoryGirl.create(:permission)
      permission3 = FactoryGirl.create(:permission)
      group.permissions << [permission, permission2]
      other_group.permissions << permission3
      subject.groups << other_group

      expect(subject.permission_strings)
        .to(match_array([permission.name, permission2.name, permission3.name]))
    end
  end
end
