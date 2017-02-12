require 'rails_helper'

RSpec.describe ProjectTypesController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

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
end
