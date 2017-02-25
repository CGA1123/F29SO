require 'rails_helper'

RSpec.describe ProjectGroupUsersController, type: :controller do
  let(:project) { FactoryGirl.create(:project) }
  let(:project_group) { FactoryGirl.create(:project_group, project: project) }
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

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
end
