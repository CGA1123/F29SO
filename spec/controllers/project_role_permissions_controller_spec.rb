require 'rails_helper'

RSpec.describe ProjectRolePermissionsController, type: :controller do
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:project_role) { FactoryGirl.create(:project_role, project: project) }
  let(:permission) { FactoryGirl.create(:permission) }

  describe 'POST #create' do
    context 'has permission' do
      before { sign_in root_user }
      context 'invalid params' do
        it 'redirect if project not found' do
          xhr :post, :create, code: 'lel', name: 'lel', permissions: 'lel'
          expect(flash[:alert]).to eq('Project not found')
        end

        it 'redirects if project_role not found' do
          xhr :post, :create, code: project.code, name: 'lel', permissions: 'le'
          expect(flash[:alert]).to eq('Not Found')
        end

        it 'redirects if permission not found' do
          p = { code: project.code, name: project_role.name, permissions: 0 }
          xhr :post, :create, p
          expect(assigns[:permission]).to be_nil
        end
      end

      context 'valid params' do
        before do
          xhr :post,
              :create,
              code: project.code,
              name: project_role.name,
              permissions: permission.id
        end

        it 'sets @project' do
          expect(assigns[:project]).to eq(project)
        end

        it 'sets @project_role' do
          expect(assigns[:project_role]).to eq(project_role)
        end

        it 'sets @permission' do
          expect(assigns[:permission]).to eq(permission)
        end

        it 'create a ProjectRolePermission' do
          expect(ProjectRolePermission.find_by(project_role: project_role,
                                               permission: permission)) \
            .not_to be_nil
        end
      end
    end

    context 'no permission' do
      before do
        sign_in no_permission
      end

      it_behaves_like 'no permission' do
        let(:req) do
          { xhr: true,
            method: :post,
            action: :create,
            params: { code: project.code,
                      name: project_role.name,
                      permission: permission.id } }
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        before do
          ProjectRolePermission.create(project_role: project_role,
                                       permission: permission)
          xhr :delete,
              :destroy,
              code: project.code,
              name: project_role.name,
              permissions: permission.id
        end

        it 'sets @project_role_permission' do
          expect(assigns[:project_role_permission]).not_to be_nil
        end

        it 'removes permission' do
          expect(project_role.permissions).not_to include(permission)
        end
      end

      context 'invalid params' do
        before do
          xhr :delete,
              :destroy,
              code: project.code,
              name: project_role.name,
              permissions: permission.id
        end

        it do
          expect(assigns[:project_role_permission]).to be_nil
        end

        it 'sets alert' do
          expect(flash[:alert]).to eq('Permission not found')
        end
      end
    end

    context 'no permission' do
      before do
        sign_in no_permission
      end

      it_behaves_like 'no permission' do
        let(:req) do
          { xhr: true,
            method: :post,
            action: :create,
            params: { code: project.code,
                      name: project_role.name,
                      permission: permission.id } }
        end
      end
    end
  end
end
