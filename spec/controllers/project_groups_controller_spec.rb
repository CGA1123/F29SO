require 'rails_helper'

RSpec.describe ProjectGroupsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:project_group) { FactoryGirl.create(:project_group, project: project) }


  describe 'GET #index' do
    context 'no permission' do
      before { sign_in user }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :get, action: :index, params: { code: project_group.project.code } }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        get :index, code: project.code
      end

      it { expect(response).to be_success }

      it 'sets @project_groups' do
        expect(assigns[:project_groups]).to eq(project.project_groups)
      end

      it 'sets @project' do
        expect(assigns[:project]).to eq(project)
      end
    end
  end

  describe 'POST #create' do
    before do
      sign_in user
    end

    context 'valid params' do
      before do
        post :create, code: project.code, project_group: { name: 'test' }
      end

      it do
        expect(response).to be_success
      end

      it 'creates a new group' do
        expect(ProjectGroup.find_by(name: 'test', project: project))
          .not_to be_nil
      end
    end

    context 'invalid params' do
      let(:params) { { code: {} } }
      it 'does not create a new project_group' do
        expect { post :create, project.code, params }.to change(ProjectGroup, :count).by(0)
      end
    end
  end
end
