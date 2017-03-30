require 'rails_helper'

RSpec.describe ProjectRoleLocationsController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:project_role) { FactoryGirl.create(:project_role, project: project) }
  let(:location) { FactoryGirl.create(:location) }

  describe 'POST #create' do
    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        before do
          xhr :post, :create, code: project.code,
                              name: project_role.name,
                              location_name: location.name
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
                      location_name: location.name } }
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
                                 location_name: location.name
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
                      location_name: location.name } }
        end
      end
    end
  end
end
