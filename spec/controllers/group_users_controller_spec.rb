require 'rails_helper'

RSpec.describe GroupUsersController, type: :controller do
  let(:group) { FactoryGirl.create(:group) }
  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }

  describe 'GET #index' do
    before { get :index, name: group.name }

    it { expect(response).to be_success }

    it 'sets @group' do
      expect(assigns[:group]).to eq(group)
    end
  end

  describe 'POST #create' do
    before { post :create, name: group.name }

    it { expect(response).to be_redirect }

    it 'sets @group' do
      expect(assigns[:group]).to eq(group)
    end
  end

  describe 'DELETE #destroy' do
    before { delete :destroy, name: group.name }

    it 'sets @group' do
      expect(assigns[:group]).to eq(group)
    end

    it { expect(response).to be_redirect }

    context 'removing user w/ multiple groups from a group' do
      let(:group_user) { GroupUser.create(user: user, group: group) }

      before { delete :destroy, name: group.name, id: group_user.id }

      it 'removes user from group' do
        expect(user.groups).not_to include(group)
      end
    end

    context 'removing user w/ only 1 group' do
      let(:group) { user.groups.first }
      let(:group_user) { GroupUser.where(user: user, group: group).first }

      before { delete :destroy, name: group.name, id: group_user.id }

      it 'does not remove group' do
        expect(user.groups).to include(group)
      end

      it 'sets alert' do
        expect(flash[:alert]).to eq("Can't remove user from group." \
          'A user must belong to at least one group.')
      end
    end
  end
end
