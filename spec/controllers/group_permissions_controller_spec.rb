require 'rails_helper'

RSpec.describe GroupPermissionsController, type: :controller do
  let(:group) { FactoryGirl.create(:group) }
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

  describe 'GET #index' do
    describe 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) do
          { method: :get,
            action: :index,
            params: { name: group.name },
            xhr: true }
        end
      end
    end

    describe 'has permission' do
      before do
        sign_in root_user
        xhr :get, :index, name: group.name
      end

      it { expect(response).to be_success }
      it { expect(response).to render_template('group_permissions/index') }

      it 'assigns @group_permissions' do
        expect(assigns[:group_permissions]).to eq(group.permissions)
      end
    end
  end

  describe 'POST #create' do
    describe 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) do
          { method: :post,
            action: :create,
            params: { name: group.name },
            xhr: true }
        end
      end
    end

    describe 'has permission' do
      before { sign_in root_user }
    end
  end

  describe 'DELETE #destroy' do
    describe 'no permission' do
      it_behaves_like 'no permission' do
        before { sign_in no_permission }

        let(:req) do
          { method: :delete,
            action: :destroy,
            params: { name: group.name },
            xhr: true }
        end
      end
    end

    describe 'has permission' do
      before { sign_in root_user }
    end
  end
end
