require 'rails_helper'

RSpec.describe ProjectRoleUsersController, type: :controller do
  let(:project) { FactoryGirl.create(:project) }
  let(:project_role) { FactoryGirl.create(:project_role, project: project) }
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

  describe 'POST #create' do
    context 'no permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :post,
            action: :create,
            params: { code: project.code, name: project_role.name },
            xhr: true }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        xhr :post,
            :create, code: project.code,
                     name: project_role.name,
                     id: root_user.id
      end

      it { expect(response).to be_success }

      it 'sets @project_role' do
        expect(assigns[:project_role]).to eq(project_role)
      end

      it 'adds user to project group' do
        expect(project_role.users).to include(root_user)
      end

      context 'params invalid' do
        it 'redirect if project not found' do
          xhr :post, :create, code: 'lel', name: 'lel', id: 'id'
          expect(flash[:alert]).to eq('Project not found')
        end

        it 'redirects if project_role not found' do
          xhr :post, :create, code: project.code, name: 'lel', permissions: 'id'
          expect(response.status).to be(404)
        end

        it 'redirects if id not found' do
          xhr :post, :create, code: project.code,
                              name: project_role.name,
                              id: 'id'
          expect(response.status).to be(404)
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'no permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :delete,
            action: :destroy,
            params: { code: project.code,
                      name: project_role.name,
                      id: no_permission.id },
            xhr: true }
        end
      end
    end

    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        before do
          ProjectRoleUser.create(project_role: project_role,
                                 user: root_user)
          xhr :delete,
              :destroy,
              code: project.code,
              name: project_role.name,
              id: root_user.id
        end

        it 'sets @project_role_user' do
          expect(assigns[:project_role_user]).not_to be_nil
        end

        it 'removes user' do
          expect(root_user.project_roles).not_to include(project_role)
        end
      end

      context 'invalid params' do
        before do
          xhr :delete,
              :destroy,
              code: project.code,
              name: project_role.name,
              id: ''
        end

        it do
          expect(assigns[:user]).to be_nil
        end

        it '404' do
          expect(response.status).to be(404)
        end
      end
    end
  end

  describe 'POST #search' do
    context 'no permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :post,
            action: :search,
            params: { code: project.code,
                      name: project_role.name,
                      user: no_permission.first_name },
            xhr: true }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        xhr :post, :search, code: project.code,
                            name: project_role.name,
                            user: root_user.first_name
      end

      it 'sets @results to matching users' do
        expect(assigns[:users]).not_to be_nil
      end

      it do
        expect(response).to render_template('project_role_users/search')
      end
    end
  end
end
