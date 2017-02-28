require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:project) { FactoryGirl.create(:project) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:user) { FactoryGirl.create(:user) }

  describe 'GET #index' do
    before do
      sign_in user
      get :index
    end

    it do
      expect(response).to be_success
    end

    it 'assigns @projects' do
      expect(assigns[:projects]).to eq(Project.all)
    end
  end

  describe 'GET #new' do
    context 'user has permission' do
      before do
        sign_in root_user
        get :new
      end

      it { expect(response).to be_success }

      it 'assigns @project' do
        expect(assigns[:project]).not_to be_nil
      end
    end

    context 'user does not have permission' do
      before do
        sign_in user
        get :new
      end

      it { expect(response).to redirect_to(projects_path) }

      it 'sets alert' do
        expect(flash[:alert]).to eq('You cannot do that.')
      end
    end
  end

  describe 'POST #create' do
    context 'user has permission' do
      before { sign_in root_user }

      context 'params valid' do
        before { post :create, valid_params }

        let(:proj_type) { FactoryGirl.create(:project_type) }
        let(:valid_params) do
          { project: { name: 'ProjX',
                       code: 'X',
                       project_type_id: proj_type.id } }
        end

        it do
          expect(response).to \
            redirect_to(project_path(code: valid_params[:project][:code]))
        end

        it 'creates a new Project' do
          expect(Project.find_by(code: 'X')).not_to be_nil
        end

        it 'create the owner group' do
          proj = Project.find_by(code: 'X')
          expect(ProjectGroup.where(project: proj).first).to be_persisted
        end
      end

      context 'params invalid' do
        let(:invalid_params) do
          { project: { name: 'hello' } }
        end

        it do
          post :create, invalid_params
          expect(response).to render_template(:new)
        end

        it 'does not create a new Project' do
          expect { post :create, invalid_params }
            .not_to change(Project, :count)
        end
      end
    end

    context 'user does not have permission' do
      before do
        sign_in user
        post :create, project: { name: 'do not care' }
      end

      it { expect(response).to redirect_to(projects_path) }

      it 'sets alert' do
        expect(flash[:alert]).to eq('You cannot do that.')
      end
    end
  end

  describe 'GET #show' do
    context 'user has permission' do
      before { sign_in root_user }

      context 'project exists' do
        it do
          get :show, code: project.code
          expect(response).to be_success
        end
      end

      context 'project does not exist' do
        before { get :show, code: 'waddup' }

        it do
          expect(response).to redirect_to projects_path
        end

        it 'sets alert' do
          expect(flash[:alert]).to eq('Project not found.')
        end
      end
    end

    context 'user does not have permission' do
      before do
        sign_in user
        get :show, code: project.code
      end
      it { expect(response).to redirect_to(projects_path) }

      it 'sets alert' do
        expect(flash[:alert]).to eq('You cannot do that.')
      end
    end
  end

  describe 'GET #edit' do
    context 'user has permission' do
      before { sign_in root_user }

      context 'project exists' do
        it do
          get :edit, code: project.code
          expect(response).to be_success
        end
      end

      context 'project does not exist' do
        before { get :edit, code: 'waddup' }

        it do
          expect(response).to redirect_to projects_path
        end

        it 'sets alert' do
          expect(flash[:alert]).to eq('Project not found.')
        end
      end
    end

    context 'user does not have permission' do
      before do
        sign_in user
        get :edit, code: project.code
      end

      it { expect(response).to redirect_to(projects_path) }

      it 'sets alert' do
        expect(flash[:alert]).to eq('You cannot do that.')
      end
    end
  end

  describe 'PATCH #update' do
    context 'user has permission' do
      before { sign_in root_user }

      context 'project exists' do
        context 'params valid' do
          let(:valid_params) do
            { code: project.code, project: { code: 'hello' } }
          end

          before { patch :update, valid_params }

          it 'updates the Project' do
            expect(project.reload.code).to eq('hello')
          end

          it do
            expect(response).to redirect_to(project_path(project.reload.code))
          end
        end

        context 'params invalid' do
          let(:invalid_params) do
            { code: project.code, project: { code: '' } }
          end

          it 'updates the Project' do
            expect { patch :update, invalid_params }
              .not_to change { project.reload.code }
          end

          it do
            patch :update, invalid_params
            expect(response).to render_template(:edit)
          end
        end
      end

      context 'project does not exist' do
        before { patch :update, code: 'waddup' }

        it do
          expect(response).to redirect_to projects_path
        end

        it 'sets alert' do
          expect(flash[:alert]).to eq('Project not found.')
        end
      end
    end

    context 'user does not have permission' do
      before do
        sign_in user
        patch :update, code: project.code, project: { name: 'hello' }
      end

      it { expect(response).to redirect_to(projects_path) }

      it 'sets alert' do
        expect(flash[:alert]).to eq('You cannot do that.')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'user has permission' do
      before { sign_in root_user }

      context 'project does not exist' do
        before { delete :destroy, code: 'waddup' }

        it do
          expect(response).to redirect_to projects_path
        end

        it 'sets alert' do
          expect(flash[:alert]).to eq('Project not found.')
        end
      end

      context 'project exists' do
        before { delete :destroy, code: project.code }
        it 'deletes project' do
          expect(Project.find_by(code: project.code)).to be_nil
        end

        it do
          expect(response).to redirect_to(projects_path)
        end
      end
    end

    context 'user does not have permission' do
      before do
        sign_in user
        delete :destroy, code: project.code
      end

      it { expect(response).to redirect_to(projects_path) }

      it 'sets alert' do
        expect(flash[:alert]).to eq('You cannot do that.')
      end
    end
  end
end
