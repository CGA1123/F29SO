require 'rails_helper'

RSpec.describe ProjectGroupsController, type: :controller do
<<<<<<< 4b46f7f735f3f3aa8cfe8c4f21885d8b82edb802
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
=======
  let(:project) { FactoryGirl.create(:project) }
  let(:project_group) { FactoryGirl.create(:project_group) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  before { sign_in root_user }

  describe 'GET #index' do

    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission', method: :get, action: :index, params: {}
    end

    context 'User does have permission' do
      before do
        sign_in root_user
        get :index
>>>>>>> Fixed merge conflicts
      end

      it do
        expect(response).to be_success
      end

<<<<<<< 4b46f7f735f3f3aa8cfe8c4f21885d8b82edb802
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

  describe 'POST #search' do
    context 'no permission' do
      before { sign_in user }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :post,
            action: :search,
            params: { code: project, name: 'test', user: user.first_name },
            xhr: true }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        xhr :post, :search, code: project, name: 'test', user: root_user.first_name
      end

      it 'sets @results to matching users' do
        expect(assigns[:results]).to match(User.search(root_user.first_name))
      end

      it do
        expect(response).to render_template('project_group_users/search')
      end
    end
  end

=======
      it 'sets @groups' do
        expect(assigns[:project_groups]).to eq(ProjectGroup.where(project: Project))
      end

      it 'sets @group' do
        expect(assigns[:project_group]).not_to be_nil
      end
    end
  end
>>>>>>> Fixed merge conflicts
end
