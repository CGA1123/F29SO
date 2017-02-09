require 'rails_helper'

RSpec.describe GroupUsersController, type: :controller do
  let(:group) { FactoryGirl.create(:group) }
  let(:group_name) { group.name }
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

  describe 'GET #index' do
    context 'no permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :get, action: :index, params: { name: group.name } }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        get :index, name: group.name
      end

      it { expect(response).to be_success }

      it 'sets @group' do
        expect(assigns[:group]).to eq(group)
      end
    end
  end

  describe 'POST #create' do
    context 'no permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :post,
            action: :create,
            params: { name: group.name, id: no_permission.id } }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        post :create, name: group.name, id: root_user.id
      end

      it { expect(response).to be_redirect }

      it 'sets @group' do
        expect(assigns[:group]).to eq(group)
      end

      it 'adds user to group' do
        expect(group.users).to include(root_user)
      end

      context 'params invalid' do
        before { post :create, name: group.name, id: 'id' }

        it { redirect_to group_path(name: group.name) }

        it 'sets alert' do
          expect(flash[:alert]).to eq('User not found.')
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'no permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :post,
            action: :create,
            params: { name: group.name, id: no_permission.id } }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        delete :destroy, name: group.name
      end

      it 'sets @group' do
        expect(assigns[:group]).to eq(group)
      end

      it { expect(response).to be_redirect }

      context 'removing user w/ multiple groups from a group' do
        let(:group_user) { GroupUser.create(user: root_user, group: group) }

        before { delete :destroy, name: group.name, id: group_user.id }

        it 'removes user from group' do
          expect(root_user.groups).not_to include(group)
        end
      end

      context 'removing user w/ only 1 group' do
        let(:group) { root_user.groups.first }
        let(:group_user) do
          GroupUser.where(user: root_user, group: group).first
        end

        before { delete :destroy, name: group.name, id: group_user.id }

        it 'does not remove group' do
          expect(root_user.groups).to include(group)
        end

        it 'sets alert' do
          expect(flash[:alert]).to eq("Can't remove user from group." \
            'A user must belong to at least one group.')
        end
      end
    end
  end

  describe 'POST #search' do
    context 'no permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :post,
            action: :search,
            params: { name: group.name, user: no_permission.first_name },
            xhr: true }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        xhr :post, :search, name: group.name, user: root_user.first_name
      end

      it 'sets @results to matching users' do
        expect(assigns[:results]).to match(User.search(root_user.first_name))
      end

      it do
        expect(response).to render_template('group_users/search')
      end
    end
  end
end
