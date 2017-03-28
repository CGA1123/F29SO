require 'rails_helper'

RSpec.describe ProjectRolesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:project_role) { FactoryGirl.create(:project_role, project: project) }

  describe 'POST #create' do
    context 'no permission' do
      before { sign_in user }
      it_behaves_like 'no permission' do
        let(:req) do
          { xhr: true, method: :get, action: :create, params: {
            code: project.code
          } }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
      end

      context 'valid params' do
        before do
          xhr :post, :create, code: project.code, project_role: { name: 'test' }
        end

        it do
          expect(response).to be_success
        end

        it do
          expect(response).to render_template('project_roles/create')
        end

        it 'creates a new group' do
          expect(ProjectRole.find_by(name: 'test', project: project))
            .not_to be_nil
        end
      end

      context 'invalid params' do
        let(:params) do
          { code: project.code, project_role: { name: '' } }
        end
        it 'does not create a new project_role' do
          expect { xhr :post, :create, params }
            .to change(ProjectRole, :count).by(0)
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'no permission' do
      before { sign_in user }
      it_behaves_like 'no permission' do
        let(:req) do
          { xhr: true, method: :get, action: :destroy, params: {
            code: project.code, name: project_role.name
          } }
        end
      end
    end

    context 'has permisison' do
      before do
        sign_in root_user
        xhr :delete, :destroy, code: project.code, name: project_role.name
      end

      it 'removes the project group' do
        expect(project.project_roles).not_to include(project_role)
      end

      it do
        expect(response).to render_template('project_roles/destroy')
      end
    end

    context 'deleting Owner group' do
      before do
        sign_in root_user
        FactoryGirl.create(:project_role, name: 'Owner', project: project)
        xhr :delete, :destroy, code: project.code, name: 'Owner'
      end

      it 'does not delete group' do
        expect(ProjectRole.find_by(project: project, name: 'Owner'))
          .not_to be_nil
      end
    end
  end
end
