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
    before { post :create, name: group.name, id: user.id }

    it { expect(response).to be_redirect }

    it 'sets @group' do
      expect(assigns[:group]).to eq(group)
    end

    it 'adds user to group' do
      expect(group.users).to include(user)
    end

    context 'params invalid' do
      before { post :create, name: group.name, id: 'id' }

      it { redirect_to group_path(name: group.name) }

      it 'sets alert' do
        expect(flash[:alert]).to eq('User not found.')
      end
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

  describe 'POST #search' do
    before { xhr :post, :search, name: group.name, user: user.first_name }

    it 'sets @results to matching users' do
      expect(assigns[:results]).to match(User.search(user.first_name))
    end

    it do
      expect(response).to render_template('group_users/search.js.erb')
    end
  end
end
