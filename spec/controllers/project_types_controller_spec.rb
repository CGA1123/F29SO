require 'rails_helper'

RSpec.describe ProjectTypesController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

  describe 'GET #index' do
    context 'no permission' do
      before { sign_in no_permission }

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

      it 'assigns @project_types' do
        expect(assigns[:project_types]).to eq(ProjectType.all)
      end
    end
  end
end
