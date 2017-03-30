require 'rails_helper'

RSpec.describe AdminPanelController, type: :controller do
  let(:no_permissions) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

  describe 'GET #index' do
    context 'no permissions' do
      before { sign_in no_permissions }

      it_behaves_like 'no permission' do
        let(:req) { { method: :get, action: :index, params: {} } }
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        get :index
      end

      it { expect(response).to be_success }

      it 'assigns @invitations_count' do
        expect(assigns[:invitations_count]).to eq(Invitation.count)
      end

      it 'assigns @project_types_count' do
        expect(assigns[:project_types_count]).to eq(ProjectType.count)
      end

      it 'assigns @groups_count' do
        expect(assigns[:groups_count]).to eq(Group.count)
      end
    end
  end
end
