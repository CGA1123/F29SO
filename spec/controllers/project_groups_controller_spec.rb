require 'rails_helper'

RSpec.describe ProjectGroupsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:project_group) { FactoryGirl.create(:project_group, project: project) }

  describe 'GET #index' do
    context 'User does not have permission' do
      before { sign_in user }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :get, action: :index, params: { code: project.code } }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
      end

      context 'project exists' do
        before { get :index, code: project.code }
        it { expect(response).to be_success }

        it 'sets @project_groups' do
          expect(assigns[:project_groups]).to eq(project.project_groups)
        end

        it 'sets @project' do
          expect(assigns[:project]).to eq(project_group.project)
        end
      end

      context 'project does not exist' do
        before { get :index, code: 'lel_no_project_to_see_here' }

        it 'sets @project to nil' do
          expect(assigns[:project]).to be_nil
        end

        it { expect(response).to redirect_to(projects_path) }

        it 'sets alert' do
          expect(flash[:alert]).to eq('Project not found')
        end
      end
    end
  end

  describe 'POST #create' do
    context 'no permission' do
      before { sign_in user }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :get, action: :create, params: { code: project.code } }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
      end

      context 'valid params' do
        before do
          post :create, code: project.code, project_group: { name: 'test' }
        end

        it do
          expect(response).to be_success
        end

        it do
          expect(response).to render_template(:index)
        end

        it 'creates a new group' do
          expect(ProjectGroup.find_by(name: 'test', project: project))
            .not_to be_nil
        end
      end

      context 'invalid params' do
        let(:params) do
          { code: project.code, project_group: { name: '' } }
        end
        it 'does not create a new project_group' do
          expect { post :create, params }
            .to change(ProjectGroup, :count).by(0)
        end
      end
    end
  end

  describe 'GET #show' do
    context 'no permission' do
      before { sign_in user }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :get, action: :show, params: { code: project.code,
                                                   name: project_group.name } }
        end
      end
    end

    context 'has permission' do
      before { sign_in root_user }

      context 'invalid project' do
        before { get :show, code: 'lel_no_project_to_see_here', name: 'lol' }

        it 'sets @project to nil' do
          expect(assigns[:project]).to be_nil
        end

        it { expect(response).to redirect_to(projects_path) }

        it 'sets alert' do
          expect(flash[:alert]).to eq('Project not found')
        end
      end

      context 'valid project' do
        context 'valid group' do
          before { get :show, code: project.code, name: project_group.name }

          it 'sets @project' do
            expect(assigns[:project]).to eq(project)
          end

          it 'sets @project_group' do
            expect(assigns[:project_group]).to eq(project_group)
          end

          it { expect(response).to render_template('project_groups/show') }
        end

        context 'invalid group' do
          before { get :show, code: project.code, name: 'lol' }

          it 'sets @project' do
            expect(assigns[:project]).to eq(project)
          end

          it do
            expect(response) \
              .to redirect_to(project_groups_path(code: project.code))
          end

          it 'sets alert' do
            expect(flash[:alert]).to eq('Not found')
          end
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'no permission' do
      before { sign_in user }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :get, action: :show, params: { code: project.code,
                                                   name: project_group.name } }
        end
      end
    end

    context 'has permisison' do
      before do
        sign_in root_user
        delete :destroy, code: project.code, name: project_group.name
      end

      it 'removes the project group' do
        expect(project.project_groups).not_to include(project_group)
      end

      it do
        expect(response).to redirect_to(project_groups_path(code: project.code))
      end
    end
  end
end
