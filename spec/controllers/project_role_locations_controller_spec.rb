require 'rails_helper'

RSpec.describe ProjectRoleLocationsController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:project_role) { FactoryGirl.create(:project_role, project: project) }
  let(:location) { FactoryGirl.create(:location) }

  describe 'GET #index' do
    context 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) do
          { xhr: true,
            method: :get,
            action: :index,
            params: { code: project.code, name: project_role.name } }
        end
      end
    end

    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        before do
          xhr :get, :index, code: project.code, name: project_role.name
        end

        it 'sets @project_role' do
          expect(assigns[:project_role]).to eq(project_role)
        end

        it 'sets @project_role_locations' do
          expect(assigns[:project_role_locations])
            .to eq(project_role.locations)
        end

        it do
          expect(response).to render_template('project_role_locations/index')
        end
      end

      context 'invalid params' do
        before { sign_in root_user }

        it 'redirects if project_role not found' do
          xhr :post, :create, code: project.code, name: 'lel', permissions: 'le'
          expect(flash[:alert]).to eq('Not Found')
        end
      end
    end
  end

  describe 'POST #create' do
    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        before do
          xhr :post, :create, code: project.code,
                              name: project_role.name,
                              location_id: location.id
        end

        it 'adds location to project_role' do
          expect(project_role.locations).to include(location)
        end
      end
    end

    context 'no permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { xhr: true,
            method: :post,
            action: :create,
            params: { code: project.code,
                      name: project_role.name,
                      location: location.id } }
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        it 'removes location from project' do
          ProjectRoleLocation.create(location: location,
                                     project_role: project_role)
          xhr :delete, :destroy, code: project.code, name: project_role.name,
                                 location_id: location.id
          expect(project_role.locations).not_to include(location)
        end
      end
    end

    context 'no permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { xhr: true,
            method: :delete,
            action: :destroy,
            params: { code: project.code,
                      name: project_role.name,
                      location: location.id } }
        end
      end
    end
  end

  describe 'GET #edit' do
    it 'sets @source' do
      sign_in root_user
      xhr :get, :edit, code: project.code, name: project_role.name
      expect(assigns[:source]).not_to be_nil
    end
  end
end
