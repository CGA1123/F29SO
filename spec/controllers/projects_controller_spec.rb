require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:root_user) { FactoryGirl.create(:root_user) }
  before { sign_in root_user }

  describe 'GET #index' do
    it do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it do
      get :show, id: 'hello'
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it do
      get :edit, id: 'hello'
      expect(response).to be_success
    end
  end

  describe 'PATCH #update' do
    it 'returns http success' do
      patch :update, id: 'hello'
      expect(response).to redirect_to(projects_path)
    end
  end

end
