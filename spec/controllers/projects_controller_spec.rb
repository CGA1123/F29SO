require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:project) { FactoryGirl.create(:project) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  before { sign_in root_user }

  describe 'GET #index' do
    before { get :index }

    it do
      expect(response).to be_success
    end

    it 'assigns @projects' do
      expect(assigns[:projects]).to eq(Project.all)
    end
  end

  describe 'GET #show' do
    context 'project exists' do
      it do
        get :show, code: project.code
        expect(response).to be_success
      end
    end

    context 'project does not existt' do
      before { get :show, code: 'waddup' }

      it do
        expect(response).to redirect_to projects_path
      end

      it 'sets alert' do
        expect(flash[:alert]).to eq('Project not found.')
      end
    end
  end

  describe 'GET #edit' do
    context 'project exists' do
      it do
        get :edit, code: project.code
        expect(response).to be_success
      end
    end

    context 'project does not existt' do
      before { get :edit, code: 'waddup' }

      it do
        expect(response).to redirect_to projects_path
      end

      it 'sets alert' do
        expect(flash[:alert]).to eq('Project not found.')
      end
    end
  end

  describe 'PATCH #update' do
    context 'project exists' do
      it do
        patch :update, code: project.code
        expect(response).to redirect_to(projects_path)
      end
    end

    context 'project does not existt' do
      before { patch :update, code: 'waddup' }

      it do
        expect(response).to redirect_to projects_path
      end

      it 'sets alert' do
        expect(flash[:alert]).to eq('Project not found.')
      end
    end
  end

end
