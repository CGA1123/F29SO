require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let!(:group) { FactoryGirl.create(:group) }

  describe 'GET #index' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) { { method: :get, action: :index, params: {} } }
      end
    end

    context 'User does have permission' do
      before do
        sign_in root_user
        get :index
      end

      it do
        expect(response).to be_success
      end

      it 'sets @groups' do
        expect(assigns[:groups]).to eq(Group.all)
      end

      it 'sets @group' do
        expect(assigns[:group]).not_to be_nil
      end
    end
  end

  describe 'GET #show' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) { { method: :get, action: :index, params: {} } }
      end
    end

    context 'User does have permission' do
      before do
        sign_in root_user
      end

      context 'group exists' do
        it 'sets @group' do
          get :show, name: group.name
          expect(assigns[:group]).to eq(group)
        end
      end

      context 'group does not exist' do
        before { get :show, name: 'doesnt_exist' }
        it { expect(response).to redirect_to(groups_path) }

        it 'sets alert' do
          expect(flash[:alert]).to eq('Group not found')
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) { { method: :delete, action: :destroy, params: {} } }
      end
    end

    context 'User does have permission' do
      before { sign_in root_user }
      context 'deleting a normal group' do
        it 'deletes the Group' do
          expect { delete :destroy, name: group.name }
            .to change(Group, :count).by(-1)
        end

        it do
          delete :destroy, name: group.name
          expect(response).to redirect_to(groups_path)
        end
      end

      context 'deleting root group' do
        it 'does not deletes the Group' do
          expect { delete :destroy, name: 'root' }
            .not_to change(Group, :count)
        end

        it do
          delete :destroy, name: 'root'
          expect(response).to redirect_to(groups_path)
        end

        it 'sets alert' do
          delete :destroy, name: 'root'
          expect(flash[:alert])
            .to eq("You're not allowed to delete the root group.")
        end
      end
    end
  end

  describe 'POST #create' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission',
                       method: :post, action: :create, params: {}
    end

    context 'User does have permission' do
      before { sign_in root_user }

      context 'valid params' do
        let(:params) { { group: { name: 'test group', description: 'test' } } }

        it 'creates a new group' do
          expect { post :create, params }.to change(Group, :count).by(1)
        end

        it do
          post :create, params
          expect(response).to render_template(:index)
        end
      end

      context 'invalid params' do
        let(:params) { { group: { name: 'test group' } } }

        it 'does not create a new group' do
          expect { post :create, params }.to change(Group, :count).by(0)
        end

        it do
          post :create, params
          expect(response).to render_template(:index)
        end
      end
    end
  end
end
