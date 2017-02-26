require 'rails_helper'

RSpec.describe ProjectGroupUsersController, type: :controller do
=begin
  let(:project) { FactoryGirl.create(:project) }
  let(:project_group) { FactoryGirl.create(:project_group, project: project) }
  let(:user) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

  describe 'GET #index' do
    context 'no permission' do
      before { sign_in user }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :get, action: :index,
            params: { code: project_group.project.code,
                      name: project_group.name } }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        get :index, code: project_group.project.code, name: project_group.name
      end

      it { expect(response).to be_success }

      it 'sets @project_group' do
        expect(assigns[:project_group]).to eq(project_group)
      end
    end
  end

  describe 'POST #create' do
    context 'no permission' do
      before { sign_in user }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :post,
            action: :create,
            params: { code: project_group.project.code,
                      name: project_group.name,
                      id: user.id } }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        post :create, code: project_group.project.code,
                      name: project_group.name,
                      id: root_user.id
      end

      it { expect(response).to be_redirect }

      it 'sets @project_group' do
        expect(assigns[:project_group]).to eq(project_group)
      end

      it 'adds user to project_group' do
        expect(project_group.users).to include(root_user)
      end

      context 'params invalid' do
        before { post :create, code: project_group.project.code,
                               name: project_group.name,
                               id: 'id' }

        it { redirect_to project_group_path
               (code: project_group.project.code, name: project_group.name) }

        it 'sets alert' do
          expect(flash[:alert]).to eq('User not found.')
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'no permission' do
      before { sign_in user }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :post,
            action: :create,
            params: { code: project_group.project.code,
                      name: project_group.name,
                      id: user.id } }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        delete :destroy, code: project_group.project.code,
                         name: project_group.name
      end

      it 'sets @group' do
        expect(assigns[:project_group]).to eq(project_group)
      end

      it { expect(response).to be_redirect }

      context 'removing user w/ multiple groups from a project_group' do
        let(:project_group_user)
          { ProjectGroupUser.create(user: root_user,
                                    projectgroup: project_group) }

        before { delete :destroy, name: project_group.name,
                                  id: project_group_user.id }

        it 'removes user from project_group' do
          expect(root_user.project_groups).not_to include(project_group)
        end
      end

      context 'removing user w/ only 1 project_group' do
        let(:project_group) { root_user.project_groups.first }
        let(:project_group_user) do
          ProjectGroupUser.where(user: root_user,
                                 project_group: project_group).first
        end

        before { delete :destroy, name: project_group.name,
                                  id: project_group_user.id }

        it 'does not remove group' do
          expect(root_user.project_groups).to include(project_group)
        end

        it 'sets alert' do
          expect(flash[:alert]).to eq("Can't remove user from group.")
        end
      end
    end
  end

  describe 'POST #search' do
    context 'no permission' do
      before { sign_in user }
        it_behaves_like 'no permission' do
          let(:req) do
            { method: :post,
              action: :search,
              params: { code: project_group.project.code,
                        name: 'test',
                        user: user.first_name },
              xhr: true }
          end
        end
      end

    context 'has permission' do
      before do
        sign_in root_user
          xhr :post, :search, code: project.code,
                              name: 'test',
                              user: root_user.first_name
      end

      it 'sets @results to matching users' do
        expect(assigns[:results]).to match(User.search(root_user.first_name))
      end

      it do
        expect(response).to render_template('project_group_users/search')
      end
    end
  end
=end
end
