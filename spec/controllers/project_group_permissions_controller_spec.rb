require 'rails_helper'

RSpec.describe ProjectGroupPermissionsController, type: :controller do
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:project_group) { FactoryGirl.create(:project_group, project: project) }
  let(:permission) { FactoryGirl.create(:permission) }

  describe 'GET #index' do
    context 'has permission' do
      before do
        sign_in root_user
        xhr :get, :index, code: project.code, name: project_group.name
      end

      it { expect(response).to be_success }

      it 'sets @project_group_permissions' do
        expect(assigns[:project_group_permissions])
          .to eq(project_group.permissions)
      end

      it 'sets @disabled' do
        expect(assigns[:disabled]).to be_falsy
      end

      it do
        expect(response).to render_template('project_group_permissions/index')
      end
    end

    context 'no permissions' do
      before do
        sign_in no_permission
        xhr :get, :index, code: project.code, name: project_group.name
      end

      it do
        expect(response).to redirect_to(project_groups_path(code: project.code))
      end
    end
  end

  describe 'POST #create' do
    context 'has permission' do
      before { sign_in root_user }
      context 'invalid params' do
        it 'redirect if project not found' do
          xhr :post, :create, code: 'lel', name: 'lel', permissions: 'lel'
          expect(flash[:alert]).to eq('Project not found')
        end

        it 'redirects if project_group not found' do
          xhr :post, :create, code: project.code, name: 'lel', permissions: 'le'
          expect(flash[:alert]).to eq('Not Found')
        end

        it 'redirects if permission not found' do
          p = { code: project.code, name: project_group.name, permissions: 0 }
          xhr :post, :create, p
          expect(assigns[:permission]).to be_nil
        end
      end

      context 'valid params' do
        before do
          xhr :post,
              :create,
              code: project.code,
              name: project_group.name,
              permissions: permission.id
        end

        it 'sets @project' do
          expect(assigns[:project]).to eq(project)
        end

        it 'sets @project_group' do
          expect(assigns[:project_group]).to eq(project_group)
        end

        it 'sets @permission' do
          expect(assigns[:permission]).to eq(permission)
        end

        it 'create a ProjectGroupPermission' do
          expect(ProjectGroupPermission.find_by(project_group: project_group,
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
                      name: project_group.name,
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
          ProjectGroupPermission.create(project_group: project_group,
                                        permission: permission)
          xhr :delete,
              :destroy,
              code: project.code,
              name: project_group.name,
              permissions: permission.id
        end

        it 'sets @project_group_permission' do
          expect(assigns[:project_group_permission]).not_to be_nil
        end

        it 'removes permission' do
          expect(project_group.permissions).not_to include(permission)
        end
      end

      context 'invalid params' do
        before do
          xhr :delete,
              :destroy,
              code: project.code,
              name: project_group.name,
              permissions: permission.id
        end

        it do
          expect(assigns[:project_group_permission]).to be_nil
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
                      name: project_group.name,
                      permission: permission.id } }
        end
      end
    end
  end
end
