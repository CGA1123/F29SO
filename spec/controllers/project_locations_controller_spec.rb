require 'rails_helper'

RSpec.describe ProjectLocationsController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:location) { FactoryGirl.create(:location) }

  describe 'GET #index' do
    context 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) do
          { xhr: true,
            method: :get,
            action: :index,
            params: { code: project.code } }
        end
      end
    end

    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        before do
          xhr :get, :index, code: project.code
        end

        it 'sets @project' do
          expect(assigns[:project]).to eq(project)
        end

        it 'sets @project_locations' do
          expect(assigns[:project_locations]).to eq(project.locations)
        end

        it { expect(response).to render_template('project_locations/index') }
      end
    end
  end

  describe 'POST #create' do
    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        before do
          xhr :post, :create, code: project.code, location_id: location.id
        end

        it 'adds location to project' do
          expect(project.locations).to include(location)
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
            params: { code: project.code, location: location.id } }
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        it 'removes location from project' do
          ProjectLocation.create(location: location, project: project)
          xhr :delete, :destroy, code: project.code, location_id: location.id
          expect(project.locations).not_to include(location)
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
            params: { code: project.code, location: location.id } }
        end
      end
    end
  end

  describe 'GET #edit' do
    it 'sets @source' do
      sign_in root_user
      xhr :get, :edit, code: project.code
      expect(assigns[:source]).not_to be_nil
    end
  end
end
