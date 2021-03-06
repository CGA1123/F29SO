require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let!(:group) { FactoryGirl.create(:group) }

  describe 'GET #show' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { xhr: true, method: :get, action: :show, params: { name: 'lel' } }
        end
      end
    end

    context 'User does have permission' do
      before do
        sign_in root_user
      end

      context 'group exists' do
        it 'sets @group' do
          xhr :get, :show, name: group.name
          expect(assigns[:group]).to eq(group)
        end
      end

      context 'group does not exist' do
        before { xhr :get, :show, name: 'doesnt_exist' }
        it { expect(response.status).to eq(404) }
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) { { xhr: '', method: :delete, action: :destroy, params: {} } }
      end
    end

    context 'User does have permission' do
      before { sign_in root_user }
      context 'deleting a normal group' do
        it 'deletes the Group' do
          expect { xhr :delete, :destroy, name: group.name }
            .to change(Group, :count).by(-1)
        end
      end

      context 'deleting root group' do
        it 'does not deletes the Group' do
          expect { xhr :delete, :destroy, name: 'root' }
            .not_to change(Group, :count)
        end
      end
    end
  end

  describe 'POST #create' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) { { xhr: true, method: :post, action: :create, params: {} } }
      end
    end

    context 'User does have permission' do
      before { sign_in root_user }

      context 'valid params' do
        let(:params) { { group: { name: 'test group', description: 'test' } } }

        it 'creates a new group' do
          expect { xhr :post, :create, params }.to change(Group, :count).by(1)
        end
      end

      context 'invalid params' do
        let(:params) { { group: { name: 'test group' } } }

        it 'does not create a new group' do
          expect { xhr :post, :create, params }.to change(Group, :count).by(0)
        end
      end
    end
  end
end
