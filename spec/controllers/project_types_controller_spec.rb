require 'rails_helper'

RSpec.describe ProjectTypesController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:project_type) { FactoryGirl.create(:project_type) }

  describe 'GET #index' do
    context 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) { { method: :get, action: :index, params: {} } }
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        get :index
      end

      it { expect(response).to be_success }

      it 'assigns @project_types' do
        expect(assigns[:project_types]).to eq(ProjectType.all)
      end
    end
  end

  describe 'POST #create' do
    context 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) { { method: :post, action: :create, params: {}, xhr: true } }
      end
    end

    context 'has permission' do
      before { sign_in root_user }

      it do
        xhr :post, :create, project_type: { name: 'test', description: 'test' }
        expect(response).to be_success
      end

      context 'valid params' do
        before do
          xhr :post, :create, project_type: { name: 'test', description: 't' }
        end

        it 'creates a project type' do
          expect(ProjectType.find_by(name: 'test')).to be_present
        end

        it do
          expect(response).to render_template('project_types/create')
        end
      end

      context 'invalid params' do
        before do
          xhr :post, :create, project_type: { name: 'test', description: '' }
        end

        it 'does not creates a project type' do
          expect(ProjectType.find_by(name: 'test')).to be_nil
        end

        it do
          expect(response).to render_template('project_types/create')
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) do
          { method: :delete, action: :destroy, params: {}, xhr: true }
        end
      end
    end

    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        before { xhr :delete, :destroy, id: project_type.id }

        it { expect(response).to be_success }

        it 'deletes project type' do
          expect(ProjectType.find_by(id: project_type.id)).to be_nil
        end

        it { expect(response).to render_template('project_types/destroy') }
      end

      context 'invalid params' do
        before { xhr :delete, :destroy, id: 'breh' }

        it 'does not delete project type' do
          expect(ProjectType.find_by(id: project_type.id)).to be_present
        end

        it { expect(response.location).to eq(project_types_url) }
      end

      context 'project type has projects' do
        before do
          FactoryGirl.create(:project, project_type: project_type)
          xhr :delete, :destroy, id: project_type.id
        end

        it { expect(response).to be_success }

        it 'does not delete project type' do
          expect(ProjectType.find_by(id: project_type.id)).to be_present
        end

        it { expect(response).to render_template('project_types/destroy') }
      end
    end
  end

  describe 'GET #edit' do
    context 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) do
          { method: :get, action: :edit, params: { id: 'id' }, xhr: true }
        end
      end
    end

    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        before { xhr :get, :edit, id: project_type.id }

        it { expect(response).to be_success }

        it { expect(response).to render_template('project_types/edit') }
      end

      context 'invalid params' do
        before { xhr :get, :edit, id: 'id' }

        it { expect(response).to be_redirect }

        it { expect(response.location).to eq(project_types_url) }
      end
    end
  end

  describe 'PATCH #update' do
    context 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) do
          { method: :patch, action: :update, params: { id: 'id' }, xhr: true }
        end
      end
    end

    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        before do
          xhr :patch, :update, id: project_type.id, project_type: { name: 'up' }
        end

        it 'succeeds update' do
          expect(assigns[:update_success]).to be(true)
        end

        it 'updates' do
          expect(ProjectType.find(project_type.id).name).to eq('up')
        end
      end

      context 'invalid params' do
        before do
          xhr :patch, :update, id: project_type.id, project_type: { name: '' }
        end

        it { expect(response).to be_success }

        it 'fails update' do
          expect(assigns[:update_success]).to be(false)
        end

        it 'does not update' do
          expect(ProjectType.find(project_type.id).name).not_to eq('')
        end
      end

      context 'project type not found' do
        before { xhr :patch, :update, id: 'breh' }

        it { expect(response).to be_success }
      end
    end
  end
end
