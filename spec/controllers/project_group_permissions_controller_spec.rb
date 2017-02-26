require 'rails_helper'

RSpec.describe ProjectGroupPermissionsController, type: :controller do
=begin
  let(:project) {FactoryGirl.create(:project)}
  let(:project_group) { FactoryGirl.create(:project_group, project: project) }
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:permission) { FactoryGirl.create(:permission) }

  describe 'GET #index' do
    describe 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) do
          { method: :get,
            action: :index,
            params: { code: project.code, name: project_group.name },
            xhr: true }
        end
      end
    end

    describe 'has permission' do
      before do
        sign_in root_user
        xhr :get, :index, code: project.code, name: project_group.name
      end

      it { expect(response).to be_success }
      it { expect(response).to render_template
        ('project_group_permissions/index') }

      it 'assigns @group_permissions' do
        expect(assigns[:project_groups]).to eq(project.project_groups)
      end
    end
  end

  describe 'POST #create' do
    context 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) do
          { method: :post,
            action: :create,
            params: { code: project.code, name:project_group.name },
            xhr: true }
        end
      end
    end

    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        before do
          xhr :post, :create, code: project.code,
                              name: project_group.name,
                              permissions: permission.id
        end

        it { expect(response).to be_success }

        it 'assigns @permission' do
          expect(assigns[:permission]).to eq(permission)
        end

        it 'adds permission to group' do
          expect(group.permissions).to include(permission)
        end

        it 'redirects on http request' do
          post :create, name: group.name, permissions: permission.id
          expect(response).to redirect_to
            (project_group_path(name: project_group.name))
        end
      end

      context 'invalid params' do
        before do
          xhr :post, :create, code: project_group.project.code,
                              name: project_group.name, permissions: 0
        end

        it 'assigns @permission to nil' do
          expect(assigns[:permission]).to be_nil
        end

        it 'cannot add permission to group' do
          expect(project_group.permissions).not_to include(permission)
        end

        it 'redirects on http request' do
          post :create,code: project_code.project.code,
                       name: project_group.name, permissions: 0
          expect(response).to redirect_to(project_group_path(name: group.name))
        end

        it 'sets alert' do
          post :create, code: project_group.project.code,
                        name: project_group.name, permissions: 0
          expect(flash[:alert]).not_to be_nil
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'no permission' do
      it_behaves_like 'no permission' do
        before { sign_in no_permission }

        let(:req) do
          { method: :delete,
            action: :destroy,
            params: { code: project.code, name: project_group.name },
            xhr: true }
        end
      end
    end

    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        let(:gp) do
          ProjectGroupPermission.create
            (project_group: project_group, permission: permission)
        end

        before do
          xhr :delete, :destroy, code: project.code,
                                 name: project_group.name,
                                 permissions: gp.permission.id
        end

        it { expect(response).to be_success }

        it 'assigns @group_permission' do
          expect(assigns[:group_permission]).to eq(gp)
        end

        it 'removes permission from group' do
          expect(project_group.permissions).not_to include(permission)
        end

        it 'redirects on http request' do
          delete :destroy, code: project.code,
                          name: project_group.name,
                          permissions: gp.permission.id
          expect(response).to redirect_to
            (project_group_path(code: project.code, name: project_group.name))
        end
      end

      context 'invalid params' do
        context 'permission doesnt exist' do
          before do
            xhr :delete, :destroy, code: project.code,
                                   name: project_group.name,
                                   permissions: 0
          end

          it 'assigns @permission to nil' do
            expect(assigns[:permission]).to be_nil
          end

          it 'redirects on http request' do
            delete :destroy, code: project.code,
                             name: project_group.name,
                             permissions: 0
            expect(response).to redirect_to
              (project_group_path
                (code: project.code, name: project_group.name))
          end

          it 'sets alert' do
            delete :destroy, code: project.code,
                             name: project_group.name,
                             permissions: 0
            expect(flash[:alert]).not_to be_nil
          end
        end

        context 'group does not have that permission' do
          before do
            xhr :delete, :destroy, code: project.code,
                                   name: project_group.name,
                                   permissions: permission.id
          end

          it 'sets @permission' do
            expect(assigns[:permission]).to eq(permission)
          end

          it 'sets @group_permission to nil' do
            expect(assigns[:project_group_permission]).to be_nil
          end

          it 'redirects on http request' do
            delete :destroy, code: project.code,
                            name: project_group.name,
                            permissions: permission.id
            expect(response).to redirect_to
              (project_group_path(code: project.code,
                                  name: project_group.name))
          end

          it 'sets alert' do
            delete :destroy, name: project_group.name,
                            permissions: permission.id
            expect(flash[:alert]).not_to be_nil
          end
        end
      end
    end
  end
=end
end
