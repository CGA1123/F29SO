require 'rails_helper'

RSpec.describe ProjectGroupsController, type: :controller do
  let(:project) { FactoryGirl.create(:project) }
  let(:project_group) { FactoryGirl.create(:project_group) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  before { sign_in root_user }

  describe 'GET #index' do

    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission', method: :get, action: :index, params: {}
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
        expect(assigns[:project_groups]).to eq(ProjectGroup.where(project: Project))
      end

      it 'sets @group' do
        expect(assigns[:project_group]).not_to be_nil
      end
    end
  end
end
