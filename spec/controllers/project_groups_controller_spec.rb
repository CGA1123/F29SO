require 'rails_helper'

RSpec.describe ProjectGroupsController, type: :controller do
  let(:project_group) { FactoryGirl.create(:project_group) }
  let(:user) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:project) { FactoryGirl.create(:project) }

  describe 'GET #index' do
    before do
      sign_in user
    end

    it do
      get :index, code: project.code
      expect(assigns[:project_groups]).to eq(project.project_groups)
    end
  end

  describe 'POST #create' do
    before do
      sign_in user
    end

    context 'valid params' do
      let(:params) do
        { code: project.code,
          project_group: { project: project, name: 'test' } }
      end

      it do
        post :create, params
        expect(response).to \
          redirect_to(project_group_path(code: params[:code],
                                         project: params[:project_group][:project],
                                         name: params[:project_group][:name]))
      end

      it 'creates a new group' do
        expect { post :create, params }.to change(ProjectGroup, :count).by(1)
      end
    end

    context 'invalid params' do
      let(:params) { { code: {} } }
      it 'does not create a new project_group' do
        expect { post :create, params }.to change(ProjectGroup, :count).by(0)
      end
    end
  end
end
