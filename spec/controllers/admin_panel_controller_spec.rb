require 'rails_helper'

RSpec.describe AdminPanelController, type: :controller do
  let(:no_permissions) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

  describe 'GET #home' do
    context 'no permissions' do
      before { sign_in no_permissions }

      it_behaves_like 'no permission' do
        let(:req) { { method: :get, action: :home, params: {} } }
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        get :home
      end

      it { expect(response).to be_success }
    end
  end
end
